<?php
/*
 *   Crafted On Sat Jan 18 2025
 *   From his finger tips, through his IDE to your deployment environment at full throttle with no bugs, loss of data,
 *   fluctuations, signal interference, or doubt—it can only be
 *   the legendary coding wizard, Martin Mbithi (martin@devlan.co.ke, www.martmbithi.github.io)
 *   
 *   www.devlan.co.ke
 *   hello@devlan.co.ke
 *
 *
 *   The Devlan Solutions LTD Super Duper User License Agreement
 *   Copyright (c) 2022 Devlan Solutions LTD
 *
 *
 *   1. LICENSE TO BE AWESOME
 *   Congrats, you lucky human! Devlan Solutions LTD hereby bestows upon you the magical,
 *   revocable, personal, non-exclusive, and totally non-transferable right to install this epic system
 *   on not one, but TWO separate computers for your personal, non-commercial shenanigans.
 *   Unless, of course, you've leveled up with a commercial license from Devlan Solutions LTD.
 *   Sharing this software with others or letting them even peek at it? Nope, that's a big no-no.
 *   And don't even think about putting this on a network or letting a crowd join the fun unless you
 *   first scored a multi-user license from us. Sharing is caring, but rules are rules!
 *
 *   2. COPYRIGHT POWER-UP
 *   This Software is the prized possession of Devlan Solutions LTD and is shielded by copyright law
 *   and the forces of international copyright treaties. You better not try to hide or mess with
 *   any of our awesome proprietary notices, labels, or marks. Respect the swag!
 *
 *
 *   3. RESTRICTIONS, NO CHEAT CODES ALLOWED
 *   You may not, and you shall not let anyone else:
 *   (a) reverse engineer, decompile, decode, decrypt, disassemble, or do any sneaky stuff to
 *   figure out the source code of this software;
 *   (b) modify, remix, distribute, or create your own funky version of this masterpiece;
 *   (c) copy (except for that one precious backup), distribute, show off in public, transmit, sell, rent,
 *   lease, or otherwise exploit the Software like it's your own.
 *
 *
 *   4. THE ENDGAME
 *   This License lasts until one of us says 'Game Over'. You can call it quits anytime by
 *   destroying the Software and all the copies you made (no hiding them under your bed).
 *   If you break any of these sacred rules, this License self-destructs, and you must obliterate
 *   every copy of the Software, no questions asked.
 *
 *
 *   5. NO GUARANTEES, JUST PIXELS
 *   DEVLAN SOLUTIONS LTD doesn’t guarantee this Software is flawless—it might have a few
 *   quirks, but who doesn’t? DEVLAN SOLUTIONS LTD washes its hands of any other warranties,
 *   implied or otherwise. That means no promises of perfect performance, marketability, or
 *   non-infringement. Some places have different rules, so you might have extra rights, but don’t
 *   count on us for backup if things go sideways. Use at your own risk, brave adventurer!
 *
 *
 *   6. SEVERABILITY—KEEP THE GOOD STUFF
 *   If any part of this License gets tossed out by a judge, don’t worry—the rest of the agreement
 *   still stands like a boss. Just because one piece fails doesn’t mean the whole thing crumbles.
 *
 *
 *   7. NO DAMAGE, NO DRAMA
 *   Under no circumstances will Devlan Solutions LTD or its squad be held responsible for any wild,
 *   indirect, or accidental chaos that might come from using this software—even if we warned you!
 *   And if you ever think you’ve got a claim, the most you’re getting out of us is the license fee you
 *   paid—if any. No drama, no big payouts, just pixels and code.
 *
 */

session_start();
require_once('../config/config.php');
require_once('../config/checklogin.php');
check_login();
require_once('../config/codeGen.php');

$start = date('Y-m-d', strtotime($_GET['from']));
$end = date('Y-m-d', strtotime($_GET['to']));
$store = $_GET['store'];

$report_type = $_GET['type'];
if ($report_type == 'Summarized Report') {
    /* Get Summarized Report */
    function filterData(&$str)
    {
        $str = preg_replace("/\t/", "\\t", $str);
        $str = preg_replace("/\r?\n/", "\\n", $str);
        if (strstr($str, '"')) $str = '"' . str_replace('"', '""', $str) . '"';
    }

    $settings_sql = mysqli_query(
        $mysqli,
        "SELECT receipt_store_id ,  show_customer FROM receipt_customization WHERE receipt_store_id = '{$store}' AND show_customer = 'true'"
    );
    if (mysqli_num_rows($settings_sql) > 0) {
        while ($settings = mysqli_fetch_array($settings_sql)) {

            /* Excel File Name */
            $fileName = 'Summarized Sales Report From ' . date('M d Y', strtotime($start)) . ' To ' . date('M d Y', strtotime($end)) . '.xls';

            /* Excel Column Name */
            $fields = array('Item Details ', 'Quantity Sold ', 'Sold By ', 'Sold To ', 'Date Sold', 'Amount (Ksh)');
            $excelData = implode("\t", array_values($fields)) . "\n";

            /* Total Sales Amount */
            $totalAmount = 0;

            /* Fetch All Records From The Database */
            $query = $mysqli->query("SELECT * FROM sales s
            INNER JOIN products p ON p.product_id = sale_product_id
            INNER JOIN users us ON us.user_id = s.sale_user_id
            WHERE p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '$start' AND '$end'
            ORDER BY sale_datetime ASC ");

            if ($query->num_rows > 0) {
                /* Load All Fetched Rows */
                while ($row = $query->fetch_assoc()) {
                    $sale_datetime = new DateTime($row['sale_datetime'], new DateTimeZone('UTC'));
                    $offset_timezone = new DateTimeZone($timezone_offset);
                    $sale_datetime->setTimezone($offset_timezone);
                    $formatted_time = $sale_datetime->format('d M Y g:ia');

                    $sale_datetime = date('d M Y g:ia', strtotime($row['sale_datetime']));
                    $sale_amount = $row['sale_quantity'] * $row['sale_payment_amount'];
                    $totalAmount += $sale_amount;  // Accumulate total
                    $lineData = array($row['product_name'], $row['sale_quantity'], $row['user_name'], $row['sale_customer_name'], $formatted_time, $sale_amount);
                    array_walk($lineData, 'filterData');
                    $excelData .= implode("\t", array_values($lineData)) . "\n";
                }

                /* Append Total */
                $excelData .= "\t\t\t\tTotal:\t" . number_format($totalAmount, 2) . "\n";
            } else {
                $excelData .= 'No Sales Records Available...' . "\n";
            }
        }
    } else {
        /* Excel File Name */
        $fileName = 'Summarized Sales Report From ' . date('M d Y', strtotime($start)) . ' To ' . date('M d Y', strtotime($end)) . '.xls';

        /* Excel Column Name */
        $fields = array('Item Details ', 'Quantity Sold ', 'Sold By ', 'Date Sold', 'Amount (Ksh)');
        $excelData = implode("\t", array_values($fields)) . "\n";

        /* Total Sales Amount */
        $totalAmount = 0;

        /* Fetch All Records From The Database */
        $query = $mysqli->query("SELECT * FROM sales s
        INNER JOIN products p ON p.product_id = sale_product_id
        INNER JOIN users us ON us.user_id = s.sale_user_id
        WHERE p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '$start' AND '$end'
        ORDER BY sale_datetime ASC ");

        if ($query->num_rows > 0) {
            /* Load All Fetched Rows */
            while ($row = $query->fetch_assoc()) {
                $sale_datetime = new DateTime($row['sale_datetime'], new DateTimeZone('UTC'));
                $offset_timezone = new DateTimeZone($timezone_offset);
                $sale_datetime->setTimezone($offset_timezone);
                $formatted_time = $sale_datetime->format('d M Y g:ia');

                $sale_amount = $row['sale_quantity'] * $row['sale_payment_amount'];
                $totalAmount += $sale_amount;  // Accumulate total
                $lineData = array($row['product_name'], $row['sale_quantity'], $row['user_name'],  $formatted_time, $sale_amount);
                array_walk($lineData, 'filterData');
                $excelData .= implode("\t", array_values($lineData)) . "\n";
            }

            /* Append Total */
            $excelData .= "\t\t\tTotal:\t" . number_format($totalAmount, 2) . "\n";
        } else {
            $excelData .= 'No Sales Records Available...' . "\n";
        }
    }

    /* Generate Header File Encodings For Download */
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=\"$fileName\"");

    /* Render Excel Data For Download */
    echo $excelData;
    exit;
} else {
    /* Get More Composite Report */
    function filterData(&$str)
    {
        $str = preg_replace("/\t/", "\\t", $str);
        $str = preg_replace("/\r?\n/", "\\n", $str);
        if (strstr($str, '"')) $str = '"' . str_replace('"', '""', $str) . '"';
    }

    $settings_sql = mysqli_query(
        $mysqli,
        "SELECT receipt_store_id ,  show_customer FROM receipt_customization WHERE receipt_store_id = '{$store}' AND show_customer = 'true'"
    );
    if (mysqli_num_rows($settings_sql) > 0) {
        while ($settings = mysqli_fetch_array($settings_sql)) {

            /* Excel File Name */
            $fileName = 'Composite Sales Report From ' . date('M d Y', strtotime($start)) . ' To ' . date('M d Y', strtotime($end)) . '.xls';

            /* Excel Column Name */
            $fields = array(
                'Item Details',
                'Sold By',
                'Sold To',
                'Date Sold',
                'Unit Price (Ksh)',
                'Discount (Ksh)',
                'Discounted Amount (Ksh)',
                'Quantity Sold',
                'Amount (Ksh)'
            );
            $excelData = implode("\t", array_values($fields)) . "\n";

            /* Total Sales Amount */
            $totalAmount = 0;

            /* Fetch All Records From The Database */
            $query = $mysqli->query("SELECT * FROM sales s
            INNER JOIN products p ON p.product_id = sale_product_id
            INNER JOIN users us ON us.user_id = s.sale_user_id
            WHERE p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '$start' AND '$end'
            ORDER BY sale_datetime ASC ");

            if ($query->num_rows > 0) {
                /* Load All Fetched Rows */
                while ($row = $query->fetch_assoc()) {
                    $sale_datetime = new DateTime($row['sale_datetime'], new DateTimeZone('UTC'));
                    $offset_timezone = new DateTimeZone($timezone_offset);
                    $sale_datetime->setTimezone($offset_timezone);
                    $formatted_time = $sale_datetime->format('d M Y g:ia');
                    $sale_amount = $row['sale_quantity'] * $row['sale_payment_amount'];
                    $discounted_amount = $row['product_sale_price'] - $row['sale_discount'];
                    $totalAmount += $sale_amount;  // Accumulate total
                    $lineData = array(
                        $row['product_name'],
                        $row['user_name'],
                        $row['sale_customer_name'],
                        $formatted_time,
                        $row['product_sale_price'],
                        $row['sale_discount'],
                        $discounted_amount,
                        $row['sale_quantity'],
                        $sale_amount
                    );
                    array_walk($lineData, 'filterData');
                    $excelData .= implode("\t", array_values($lineData)) . "\n";
                }

                /* Append Total */
                $excelData .= "\t\t\t\t\t\t\tTotal:\t" . number_format($totalAmount, 2) . "\n";
            } else {
                $excelData .= 'No Sales Records Available...' . "\n";
            }
        }
    } else {
        /* Excel File Name */
        $fileName = 'Composite Sales Report From ' . date('M d Y', strtotime($start)) . ' To ' . date('M d Y', strtotime($end)) . '.xls';

        /* Excel Column Name */
        $fields = array(
            'Item Details',
            'Sold By',
            'Date Sold',
            'Unit Price (Ksh)',
            'Discount (Ksh)',
            'Discounted Amount (Ksh)',
            'Quantity Sold',
            'Amount (Ksh)'
        );
        $excelData = implode("\t", array_values($fields)) . "\n";

        /* Total Sales Amount */
        $totalAmount = 0;

        /* Fetch All Records From The Database */
        $query = $mysqli->query("SELECT * FROM sales s
        INNER JOIN products p ON p.product_id = sale_product_id
        INNER JOIN users us ON us.user_id = s.sale_user_id
        WHERE p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '$start' AND '$end'
        ORDER BY sale_datetime ASC ");

        if ($query->num_rows > 0) {
            /* Load All Fetched Rows */
            while ($row = $query->fetch_assoc()) {
                $sale_datetime = new DateTime($row['sale_datetime'], new DateTimeZone('UTC'));
                $offset_timezone = new DateTimeZone($timezone_offset);
                $sale_datetime->setTimezone($offset_timezone);
                $formatted_time = $sale_datetime->format('d M Y g:ia');
                $sale_amount = $row['sale_quantity'] * $row['sale_payment_amount'];
                $discounted_amount = $row['product_sale_price'] - $row['sale_discount'];
                $totalAmount += $sale_amount;  // Accumulate total
                $lineData = array(
                    $row['product_name'],
                    $row['user_name'],
                    $formatted_time,
                    $row['product_sale_price'],
                    $row['sale_discount'],
                    $discounted_amount,
                    $row['sale_quantity'],
                    $sale_amount
                );
                array_walk($lineData, 'filterData');
                $excelData .= implode("\t", array_values($lineData)) . "\n";
            }

            /* Append Total */
            $excelData .= "\t\t\t\t\t\tTotal:\t" . number_format($totalAmount, 2) . "\n";
        } else {
            $excelData .= 'No Sales Records Available...' . "\n";
        }
    }

    /* Generate Header File Encodings For Download */
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=\"$fileName\"");

    /* Render Excel Data For Download */
    echo $excelData;
    exit;
}
