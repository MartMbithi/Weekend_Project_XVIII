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
require_once('../partials/head.php');
/* Load Analytics */
require_once('../helpers/store_analytics.php');
?>

<body class="nk-body npc-invest bg-lighter ">
    <div class="nk-app-root">
        <!-- wrap @s -->
        <div class="nk-wrap ">
            <!-- main header @s -->
            <?php
            require_once('../partials/store_header.php');
            $view = $_GET['view'];
            $ret = "SELECT * FROM  store_settings WHERE store_id = '{$view}' ";
            $stmt = $mysqli->prepare($ret);
            $stmt->execute(); //ok
            $res = $stmt->get_result();
            while ($store = $res->fetch_object()) {
            ?>
                <!-- main header @e -->
                <!-- content @s -->
                <div class="nk-content nk-content-lg nk-content-fluid">
                    <div class="container-xl wide-lg">
                        <div class="nk-content-inner">
                            <div class="nk-content-body">
                                <div class="nk-block-head">
                                    <div class="nk-block-between-md g-3">
                                        <div class="nk-block-head-content">
                                            <div class="nk-block-head-sub"><span>Welcome To <?php echo $store->store_name; ?>.</span></div>
                                        </div><!-- .nk-block-head-content -->
                                    </div><!-- .nk-block-between -->
                                </div><!-- .nk-block-head -->
                                <div class="nk-block">
                                    <div class="row gy-gs">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="nk-wg-card is-s1 card card-bordered">
                                                <a href="store_reports_sales?view=<?php echo $store->store_id; ?>">
                                                    <div class="card-inner">
                                                        <div class="nk-iv-wg2">
                                                            <div class="nk-iv-wg2-title">
                                                                <h6 class="title">Todays Sales </h6>
                                                            </div>
                                                            <div class="nk-iv-wg2-text">
                                                                <div class="nk-iv-wg2-amount text-dark">
                                                                    <?php echo "Ksh " . number_format($today_sales, 2); ?>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div><!-- .card -->
                                        </div><!-- .col -->
                                        <div class="col-md-6 col-lg-4">
                                            <div class="nk-wg-card is-s1 card card-bordered">
                                                <a href="store_items_manage?view=<?php echo $store->store_id; ?>">
                                                    <div class="card-inner">
                                                        <div class="nk-iv-wg2">
                                                            <div class="nk-iv-wg2-title">
                                                                <h6 class="title">Total Items </h6>
                                                            </div>
                                                            <div class="nk-iv-wg2-text">
                                                                <div class="nk-iv-wg2-amount text-dark">
                                                                    <?php echo $products ?>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div><!-- .card -->
                                        </div><!-- .col -->
                                        <div class="col-md-12 col-lg-4">
                                            <div class="nk-wg-card is-s1 card card-bordered">
                                                <a href="store_items_manage?view=<?php echo $store->store_id; ?>">
                                                    <div class="card-inner">
                                                        <div class="nk-iv-wg2">
                                                            <div class="nk-iv-wg2-title">
                                                                <h6 class="title text-danger">Out Of Stock Items</h6>
                                                            </div>
                                                            <div class="nk-iv-wg2-amount text-danger">
                                                                <?php echo $out_of_stock ?>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div><!-- .card -->
                                        </div><!-- .col -->
                                        <div class="col-8">
                                            <div class="card mb-3  border border-success">
                                                <div class="card-inner">
                                                    <div class="card-title">
                                                        <h6 class="title text-center"><?php echo date('M d Y'); ?> Revenue Income Payment Method</h6>
                                                    </div>
                                                    <div class="nk-ck">
                                                        <canvas class="bar-chart" id="barChartMultiple"></canvas>
                                                    </div>
                                                </div>
                                            </div><!-- .card-preview -->
                                        </div>
                                        <div class="col-4">
                                            <div class="card mb-3  border border-success">
                                                <div class="card-inner">
                                                    <div class="card-title">
                                                        <h6 class="title text-center"><?php echo date('M d Y'); ?> Credit Payments Ratio</h6>
                                                    </div>
                                                    <div class="nk-ck">
                                                        <canvas class="pie-chart" id="pieChartData"></canvas>
                                                    </div>
                                                </div>
                                            </div><!-- .card-preview -->
                                        </div>
                                        <div class="col-12">
                                            <div class="card mb-3  border border-success">
                                                <div class="card-inner">
                                                    <div class="card-title">
                                                        <h6 class="title text-center"><?php echo date('M d Y'); ?> Overall Store Revenue Overview</h6>
                                                    </div>
                                                    <div class="nk-ck">
                                                        <canvas class="line-chart" id="filledLineChart"></canvas>
                                                    </div>
                                                </div>
                                            </div><!-- .card-preview -->
                                        </div>
                                        <div class="col-md-6 col-xxl-4">
                                            <div class="card card-bordered h-100 border border-success">
                                                <div class="card-inner border-bottom">
                                                    <div class="card-title-group">
                                                        <div class="card-title">
                                                            <h6 class="title">Today Overall Stores Sales Logs</h6>
                                                        </div>
                                                        <div class="card-tools">
                                                            <a href="store_sales_manage?view=<?php echo $store->store_id; ?>" class="link">View All</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-inner">
                                                    <div class="timeline">
                                                        <h6 class="timeline-head"><?php echo date('d M Y'); ?></h6>
                                                        <ul class="timeline-list" style="max-height: 290px; margin-bottom: 10px; overflow:scroll; -webkit-overflow-scrolling: touch;">
                                                            <?php
                                                            /* Load Recent Sales Today */
                                                            $raw_results = mysqli_query($mysqli, "SELECT  * FROM sales s
                                                                INNER JOIN products p ON p.product_id = s.sale_product_id
                                                                INNER JOIN users u ON u.user_id = s.sale_user_id
                                                                WHERE DATE(s.sale_datetime)=CURDATE()  AND p.product_store_id = '{$view}'
                                                                ORDER BY s.sale_datetime DESC LIMIT 10");
                                                            if (mysqli_num_rows($raw_results) > 0) {
                                                                while ($results = mysqli_fetch_array($raw_results)) {

                                                                    $sale_datetime = new DateTime($results['sale_datetime'], new DateTimeZone('UTC'));
                                                                    $offset_timezone = new DateTimeZone($timezone_offset);
                                                                    $sale_datetime->setTimezone($offset_timezone);
                                                                    $formatted_time = $sale_datetime->format('g:ia');
                                                            ?>
                                                                    <li class="timeline-item">
                                                                        <div class="timeline-status bg-primary is-outline"></div>
                                                                        <div class="timeline-date"><?php echo $formatted_time; ?> <em class="text-success icon ni ni-clipboad-check-fill"></em></div>
                                                                        <div class="timeline-data">
                                                                            <h6 class="timeline-title"><?php echo $results['user_name']; ?> Sold <span class="text-success"><?php echo $results['product_name']; ?></span></h6>
                                                                            <div class="timeline-des">
                                                                                <p>
                                                                                    To <span class="text-success"><?php echo $results['sale_customer_name']; ?></span>.
                                                                                    Quantity Sold Is <span class="text-success"><?php echo $results['sale_quantity']; ?>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                <?php }
                                                            } else { ?>
                                                                <li class="timeline-item">
                                                                    <div class="timeline-status bg-danger is-outline"></div>
                                                                    <div class="timeline-date text-danger">
                                                                        <?php
                                                                        // Convert it to UTC+3
                                                                        $date = new DateTime('now', new DateTimeZone('UTC'));
                                                                        $date->setTimezone(new DateTimeZone($timezone_offset));
                                                                        echo $date->format('g:ia');
                                                                        ?>
                                                                        <em class="text-danger icon ni ni-alert-fill"></em>
                                                                    </div>
                                                                    <div class="timeline-data ">
                                                                        <h6 class="timeline-title text-danger">No Sales Recorded So Far</span></h6>
                                                                    </div>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div><!-- .card -->
                                        </div><!-- .col -->
                                        <div class="col-xl-6 col-xxl-8">
                                            <div class="card card-bordered card-full border border-success">
                                                <div class="card-inner border-bottom">
                                                    <div class="card-title-group">
                                                        <div class="card-title">
                                                            <h6 class="title">Low / Out Of Stock Items</h6>
                                                        </div>
                                                        <div class="card-tools">
                                                            <a href="store_items_inventory?view=<?php echo $store->store_id; ?>" class="link">View All</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="nk-tb-list">
                                                    <div class="nk-tb-item">
                                                        <ul class="nk-activity" style="max-height: 290px; margin-bottom: 10px; overflow:scroll; -webkit-overflow-scrolling: touch;">
                                                            <?php
                                                            /* Load Recent Out Of Stock Products */
                                                            $raw_results = mysqli_query($mysqli, "SELECT  * FROM products p
                                                                INNER JOIN store_settings ss ON ss.store_id = p.product_store_id 
                                                                WHERE product_quantity <= 1 AND p.product_store_id = '{$view}'  ORDER BY product_name ASC LIMIT 10");
                                                            if (mysqli_num_rows($raw_results) > 0) {
                                                                while ($results = mysqli_fetch_array($raw_results)) {
                                                            ?>
                                                                    <li class="nk-activity-item">
                                                                        <div class="nk-activity-data">
                                                                            <div class="label">
                                                                                <span class="text-danger"><?php echo $results['product_code'] . ' ' . $results['product_name']; ?> </span> from <?php echo $results['store_name']; ?> is out of stock, kindly plan to restock it.
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                <?php }
                                                            } else { ?>
                                                                <li class="nk-activity-item">
                                                                    <div class="nk-activity-data">
                                                                        <div class="label">
                                                                            <span class="text-success"> No out of stock items, good job in keeping your store stocked </span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div><!-- .card -->
                                        </div><!-- .col -->
                                    </div><!-- .row -->
                                </div><!-- .nk-block -->
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
            <!-- content @e -->
            <!-- footer @s -->
            <?php
            require_once('../partials/pos_footer.php');
            ?>
            <!-- footer @e -->
        </div>
        <!-- wrap @e -->
    </div>
    <!-- app-root @e -->
    <!-- JavaScript -->
    <?php
    require_once('../partials/scripts.php');
    require_once('../functions/store_sales_chart.php');
    require_once('../functions/store_revenue_chart.php');
    ?>
</body>

</html>