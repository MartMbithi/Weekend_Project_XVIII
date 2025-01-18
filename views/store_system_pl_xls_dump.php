<?php
/*
 *   Crafted On Mon Sep 16 2024
 *   By the one and only Martin Mbithi (martin@devlan.co.ke)
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
/* Default Variables */
$cumulative_income = 0;
$cumulative_expenditure = 0;

/* Get More Composite Report */
function filterData(&$str)
{
    $str = preg_replace("/\t/", "\\t", $str);
    $str = preg_replace("/\r?\n/", "\\n", $str);
    if (strstr($str, '"')) $str = '"' . str_replace('"', '""', $str) . '"';
}

/* Excel File Name */
$fileName = 'Profit / Loss Statements Report From ' . date('M d Y', strtotime($start)) . ' To ' . date('M d Y', strtotime($end)) . '.xls';

/* Excel Column Name */
$fields = array(
    'Item',
    'Date Sold',
    'Purchase Price (Ksh)',
    'Discounted Sale Amount (Ksh)',
    'Quantity Sold',
    'Margin (Ksh)',
    'Amount (Ksh)',
);

/* Implode Excel Data */
$excelData = implode("\t", array_values($fields)) . "\n";

/* Initialize totals */
$total_margin = 0;
$total_sales = 0;
$total_quantity = 0;
$cumulative_income = 0;
$cumulative_expenditure = 0;

/* Fetch All Records From The Database */
$query = $mysqli->query("SELECT * FROM sales s
INNER JOIN products p ON p.product_id = sale_product_id
INNER JOIN users us ON us.user_id = s.sale_user_id
WHERE p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '{$start}' AND '{$end}'
ORDER BY sale_datetime ASC ");
if ($query->num_rows > 0) {
    /* Load All Fetched Rows */
    while ($row = $query->fetch_assoc()) {
        /* Sanitize Log Date */
        $sale_datetime = date('d M Y g:ia', strtotime($row['sale_datetime']));
        $sales_amount = $row['sale_quantity'] * $row['sale_payment_amount'];
        $discounted_price = $row['product_sale_price'] - $row['sale_discount'];
        $sale_margin = ($discounted_price - $row['product_purchase_price']) * $row['sale_quantity'];

        /* Update cumulative totals */
        $total_margin += $sale_margin;
        $total_sales += $sales_amount;
        $total_quantity += $row['sale_quantity'];
        $cumulative_income += $sales_amount;
        $cumulative_expenditure += ($row['product_purchase_price'] * $row['sale_quantity']);

        /* Hardwire This Data Into .xls File */
        $lineData = array(
            $row['product_name'],
            $sale_datetime,
            $row['product_purchase_price'],
            $discounted_price,
            $row['sale_quantity'],
            $sale_margin,
            $sales_amount
        );
        array_walk($lineData, 'filterData');
        $excelData .= implode("\t", array_values($lineData)) . "\n";
    }

    /* Add totals row at the bottom */
    $totalsData = array(
        'TOTAL',
        '',
        '',
        '',
        $total_quantity, /* Total quantity sold */
        $total_margin,   /* Total margin */
        $total_sales     /* Total sales amount */
    );
    array_walk($totalsData, 'filterData');
    $excelData .= implode("\t", array_values($totalsData)) . "\n";

    /* Compute overall profit or loss */
    $profit_or_loss = $cumulative_income - $cumulative_expenditure;
    $profit_or_loss_data = array(
        'Profit / Loss',
        '',
        '',
        '',
        '',
        '',
        $profit_or_loss
    );
    array_walk($profit_or_loss_data, 'filterData');
    $excelData .= implode("\t", array_values($profit_or_loss_data)) . "\n";
} else {
    $excelData .= 'No Records Available...' . "\n";
}

/* Generate Header File Encodings For Download */
header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=\"$fileName\"");

/* Render Excel Data For Download */
echo $excelData;

exit;
