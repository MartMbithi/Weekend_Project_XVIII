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
require_once('../config/codeGen.php');
check_login();
require_once('../partials/head.php');
?>

<body class="nk-body npc-invest bg-lighter ">
    <div class="nk-app-root">
        <!-- wrap @s -->
        <div class="nk-wrap ">
            <!-- main header @s -->
            <?php require_once('../partials/pos_header_receipt.php'); ?>
            <!-- main header @e -->
            <!-- content @s -->
            <div class="nk-content nk-content-lg nk-content-fluid">
                <div class="container-xl wide-lg">
                    <div class="nk-content-inner">
                        <div class="nk-content-body">
                            <div class="nk-block-head">
                                <div class="nk-block-between-md g-3">
                                    <div class="nk-block-head-content">
                                        <div class="align-center flex-wrap pb-2 gx-4 gy-3">
                                            <div>
                                                <h4 class="nk-block-title fw-normal">Receipt # <?php echo $_GET['receipt']; ?> Preview</h4>
                                            </div>
                                        </div>
                                    </div><!-- .nk-block-head-content -->
                                </div><!-- .nk-block-between -->
                            </div><!-- .nk-block-head -->
                            <div class="nk-block">
                                <div class="text-center">
                                    <a href="pos?store=<?php echo $_GET['store']; ?>&action=empty" class="btn btn-primary btn-round">
                                        <em class="icon ni ni-histroy"></em> Return To Sales
                                    </a>
                                    <a href="javascript:void(0);" onclick="printReceipt()" class="btn btn-primary btn-round">
                                        <em class="icon ni ni-printer-fill"></em> Print Receipt
                                    </a>
                                </div>
                                <br>
                                <div class="d-flex justify-content-center">
                                    <div class="row gy-gs">
                                        <div id="receipt" style="card border border-success width: 80mm; font-family: Arial, sans-serif; font-size: 12px;">
                                            <?php
                                            // Load Receipt Settings
                                            $store_id = $_GET['store'];
                                            $sql = "SELECT * FROM receipt_customization WHERE receipt_store_id = '{$store_id}'";
                                            $stmt = $mysqli->prepare($sql);
                                            $stmt->execute(); // ok
                                            $res = $stmt->get_result();
                                            while ($settings = $res->fetch_object()) {
                                                if (isset($_GET['receipt']) && isset($_SESSION["cart_item"])) {
                                                    $total_quantity = 0;
                                                    $total_price = 0;
                                            ?>
                                                    <!-- Receipt Header -->
                                                    <div class="text-center">
                                                        <h4 style="margin: 5px 0;"><?php echo $settings->receipt_header_content; ?></h4>
                                                        <p style="margin: 5px 0;">
                                                            <?php
                                                            $date = new DateTime("now", new DateTimeZone('EAT'));
                                                            echo $date->format('d M Y H:i') . '<br>';
                                                            echo "Cash Sale Receipt # " . $_GET['receipt'] . '<br>';
                                                            if ($settings->receipt_show_barcode == 'true') {
                                                                echo "<img alt='barcode' src='../functions/barcode.php?codetype=Code39&size=20&text=" . $_GET['receipt'] . "&print=true'/>";
                                                            }
                                                            ?>
                                                        </p>
                                                    </div>

                                                    <!-- Items Table -->
                                                    <table cellpadding="2" cellspacing="0" style="width: 100%; font-size: 12px; border-bottom: 1px dashed #000;">
                                                        <thead>
                                                            <tr>
                                                                <th style="text-align:left;">Name</th>
                                                                <th style="text-align:right;">Qty</th>
                                                                <th style="text-align:right;">Price</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <?php
                                                            foreach ($_SESSION["cart_item"] as $item) {
                                                                $item_price = $item["quantity"] * $item["product_sale_price"];
                                                            ?>
                                                                <tr>
                                                                    <td><?php echo $item["product_name"]; ?></td>
                                                                    <td style="text-align:right;"><?php echo $item["quantity"]; ?></td>
                                                                    <td style="text-align:right;"><?php echo "Ksh " . number_format($item_price, 2); ?></td>
                                                                </tr>
                                                            <?php
                                                                $total_quantity += $item["quantity"];
                                                                $total_price += $item_price;
                                                            }
                                                            ?>
                                                            <tr>
                                                                <td colspan="2" style="text-align:right;">Total:</td>
                                                                <td style="text-align:right;"><strong><?php echo "Ksh " . number_format($total_price, 2); ?></strong></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>

                                                    <br>
                                                    <?php
                                                    // Load Logged-In User Session
                                                    $user_id = $_SESSION['user_id'];
                                                    $sql = "SELECT * FROM  users  WHERE user_id = '$user_id'";
                                                    $res = mysqli_query($mysqli, $sql);
                                                    if (mysqli_num_rows($res) > 0) {
                                                        $users = mysqli_fetch_assoc($res);
                                                    ?>
                                                        <p class="text-center" style="margin: 5px 0;">You Were Served By Dr.<?php echo $users['user_name']; ?></p>
                                                        <p class="text-center" style="margin: 5px 0;">
                                                            <i><?php echo $settings->receipt_footer_content; ?></i>
                                                        </p>
                                                    <?php } ?>
                                            <?php }
                                            }
                                            ?>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div><!-- .card -->
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .nk-block -->
        </div>
    </div>
    <!-- content @e -->
    <!-- footer @s -->
    <?php require_once('../partials/pos_footer.php'); ?>
    <!-- footer @e -->
    </div>
    <!-- wrap @e -->
    </div>
    <!-- app-root @e -->
    <!-- JavaScript -->
    <script>
        function printReceipt() {
            var receiptContent = document.getElementById("receipt").innerHTML;
            var originalContent = document.body.innerHTML;

            // Create a new window for printing
            var printWindow = window.open('', '_blank');
            printWindow.document.open();
            printWindow.document.write(`
            <html>
                <head>
                    <title>Print Receipt</title>
                    <style>
                    /* POS receipt 80mm styling */
                    #receipt {
                        width: 80mm;
                        font-family: Arial, sans-serif;
                        margin: 0;
                        padding: 0;
                        color: #000;
                    }

                    /* Header and title */
                    h4 {
                        font-size: 16px; /* Slightly larger for the clinic name */
                        font-weight: bold;
                        text-align: center;
                        margin: 0;
                    }

                    /* Subheading, such as address, contact */
                    p {
                        font-size: 13px; /* Smaller, for subtext like address, etc. */
                        text-align: center;
                        margin: 2px 0;
                    }

                    /* Date and receipt number */
                    .receipt-info {
                        font-size: 12px;
                        text-align: center;
                        margin: 2px 0;
                    }

                    * Table for items */
                table {
                    width: 100%;
                    border-collapse: collapse;
                    font-size: 10px;
                }

                /* Table header and data rows */
                th, td {
                    padding: 2px 5px; /* Reduced padding for a more compact table */
                    border-bottom: 1px dashed #000;
                }

                /* Column alignment */
                th {
                    text-align: left;
                }

                td {
                    text-align: left;
                }

                /* Specific widths for the columns */
                th:nth-child(1), td:nth-child(1) {
                    width: 60%; /* Product name column takes up more space */
                    text-align: left; /* Align product name to the left */
                }

                th:nth-child(2), td:nth-child(2) {
                    width: 15%; /* Quantity column */
                    text-align: right; /* Align quantity to the right */
                }

                th:nth-child(3), td:nth-child(3) {
                    width: 25%; /* Price column */
                    text-align: right; /* Align price to the right */
                }
                    /* Footer and Served By section */
                    .served-by {
                        font-size: 12px;
                        text-align: center;
                        margin: 10px 0;
                    }

                    /* Footer message */
                    .footer-message {
                        font-size: 12px;
                        font-style: italic;
                        text-align: center;
                        margin: 5px 0;
                    }

                    /* Hide elements that are not needed in print */
                    @media print {
                        body {
                            margin: 0;
                        }

                        .btn, a {
                            display: none;
                        }

                        #receipt {
                            width: 80mm;
                        }

                        table {
                            font-size: 10px;
                        }
                    }
                </style>
                </head>
                <body onload="window.print(); window.close();">
                    ${receiptContent}
                </body>
            </html>
        `);
            printWindow.document.close();
        }
    </script>
    <?php require_once('../partials/scripts.php'); ?>
</body>

</html>