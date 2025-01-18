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
require_once '../config/config.php';
require_once '../config/checklogin.php';
require_once '../config/codeGen.php';
check_login();
require_once('../vendor/autoload.php');

use Dompdf\Dompdf;

$dompdf = new Dompdf();
$store = $_GET['store'];
$ret = "SELECT * FROM store_settings  WHERE store_status  = 'active' AND store_id = '{$store}'";
$stmt = $mysqli->prepare($ret);
$stmt->execute(); //ok
$res = $stmt->get_result();
while ($stores = $res->fetch_object()) {

    $html = '
    <!DOCTYPE html>
    <html>

        <head>
            <meta name="" content="XYZ,0,0,1" />
            <style type="text/css">
                table {
                    font-size: 12px;
                    padding: 4px;
                }

                tr {
                    page-break-after: always;
                }

                th {
                    text-align: left;
                    padding: 4pt;
                }

                td {
                    padding: 5pt;
                }

                #b_border {
                    border-bottom: dashed thin;
                }

                legend {
                    color: #0b77b7;
                    font-size: 1.2em;
                }

                #error_msg {
                    text-align: left;
                    font-size: 11px;
                    color: red;
                }

                .header {
                    margin-bottom: 20px;
                    width: 100%;
                    text-align: left;
                    position: absolute;
                    top: 0px;
                }

                .footer {
                    width: 100%;
                    text-align: center;
                    position: fixed;
                    bottom: 5px;
                }

                #no_border_table {
                    border: none;
                }

                #bold_row {
                    font-weight: bold;
                }

                #amount {
                    text-align: right;
                    font-weight: bold;
                }

                .pagenum:before {
                    content: counter(page);
                }

                /* Thick red border */
                hr.red {
                    border: 1px solid red;
                }
                .list_header{
                    font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif;
                }
            </style>
        </head>

        <body style="margin:1px;">
            <div class="footer">
                <hr>
                <i><b>Report Generated On ' . date('d M Y') . ', Dasati medical clinic POS. Powered By Devlan Solutions LTD ~ devlan.co.ke  </b><i>
            </div>
            <div class="list_header" align="center">
                <h3>
                    ' . $stores->store_name . '
                </h3>
                <h4>
                    ' . $stores->store_email . '<br>
                    ' . $stores->store_adr . ' 
                </h4>
                <hr style="width:100%" , color=black>
                <h5>Current Store Inventory Report On ' . date('d M Y') . ' </h5>
            </div>
            <table border="1" cellspacing="0" width="98%" style="font-size:9pt">
                <thead>
                    <tr>
                        <th style="width:100%">Item Details</th>
                        <th style="width:30%">Current Stock</th>
                        <th style="width:30%">Total Purchase price</th>
                        <th style="width:30%">Total Sale price</th>
                    </tr>
                </thead>
                <tbody>
                    ';
                    $total_purchace_price ="0";
                    $total_sale_price ="0";
                    $ret = "SELECT * FROM products WHERE product_store_id = '{$store}' ORDER BY product_name ASC";
                    $stmt = $mysqli->prepare($ret);
                    $stmt->execute(); //ok
                    $res = $stmt->get_result();
                    while ($inventory = $res->fetch_object()) {
                      $total_purchase_per_item= floatval($inventory->product_purchase_price)*floatval($inventory->product_quantity);
                      $total_sale_per_item= floatval($inventory->product_sale_price)*floatval($inventory->product_quantity);

                      /*Compute Gradual Total */
                      $total_purchace_price +=$total_purchase_per_item;
                      $total_sale_price +=$total_sale_per_item;
                      
                        $html .=
                            '
                                <tr>
                                    <td>' . $inventory->product_code . ' ' . $inventory->product_name  . '</td>
                                    <td>' . $inventory->product_quantity . '</td>
                                    <td> Ksh.' .  number_format($total_purchase_per_item,2) . '</td>
                                    <td>Ksh.' .  number_format($total_sale_per_item,2) . '</td>
                                </tr>
                            ';

                    }; 
                   $html .=' <tr>
                     <td colspan="2">Total Purchase Price:<td>
                     <td>Ksh.' .  number_format($total_purchace_price,2) . '</td>
                     </tr>
                     <tr>
                     <td colspan="2">Total Sale Price:<td>
                     <td>Ksh.' .  number_format($total_sale_price,2) . '</td>
                    </tr>';
                    $html .= '
                </tbody>
            </table>
        </body>
    </html>
    ';
    $dompdf = new Dompdf();
    $dompdf->load_html($html);
    $dompdf->set_paper('A4');
    $dompdf->set_option('isHtml5ParserEnabled', true);
    $dompdf->render();
    $dompdf->stream('Inventory Report ' . date('d M Y') . '', array("Attachment" => 1));
    $options = $dompdf->getOptions();
    $options->setDefaultFont('');
    $dompdf->setOptions($options);
}
