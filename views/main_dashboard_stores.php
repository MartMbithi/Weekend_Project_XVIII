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
require_once('../config/codeGen.php');
check_login();

/* Add Store */
if (isset($_POST['create_store'])) {
    $store_id = mysqli_real_escape_string($mysqli, $sys_gen_id);
    $store_name = mysqli_real_escape_string($mysqli, $_POST['store_name']);
    $store_adr = mysqli_real_escape_string($mysqli, $_POST['store_adr']);
    $store_email = mysqli_real_escape_string($mysqli, $_POST['store_email']);

    /* Sales And Receipt Customizations */
    $receipt_store_id = mysqli_real_escape_string($mysqli, $store_id);
    $receipt_header_content = mysqli_real_escape_string($mysqli, $_POST['store_adr']);
    $receipt_footer_content = mysqli_real_escape_string($mysqli, '');
    $receipt_show_barcode = mysqli_real_escape_string($mysqli, 'false');
    $show_customer = mysqli_real_escape_string($mysqli, 'false');
    $allow_discounts = mysqli_real_escape_string($mysqli, 'false');
    $allow_loyalty_points = mysqli_real_escape_string($mysqli, 'false');

    /* Persit Payment Means */
    $payment_settings_store_id  = mysqli_real_escape_string($mysqli, $store_id);
    $payment_settings_means = mysqli_real_escape_string($mysqli, 'Cash'); /* Set Default To Cash */


    /* Log Attributes */
    $log_type = "Stores Management Logs";
    $log_details = "Registered " . $store_name . " As A New Store";

    /* Persist */
    $sql = "INSERT INTO store_settings(store_id, store_name, store_email, store_adr)
    VALUES('{$store_id}', '{$store_name}', '{$store_email}', '{$store_adr}')";

    $settings = "INSERT INTO receipt_customization(receipt_store_id, receipt_header_content, receipt_footer_content, receipt_show_barcode,
    show_customer, allow_discounts, allow_loyalty_points) 
    VALUES(
        '{$receipt_store_id}',
        '{$receipt_header_content}',
        '{$receipt_footer_content}',
        '{$receipt_show_barcode}',
        '{$show_customer}',
        '{$allow_discounts}',
        '{$allow_loyalty_points}'
    )";

    $payments = "INSERT INTO payment_settings (payment_settings_store_id, payment_settings_means) 
    VALUES(
        '{$payment_settings_store_id}',
        '{$payment_settings_means}'
    )";

    $prepare = $mysqli->prepare($sql);
    $settings_prepare = $mysqli->prepare($settings);
    $payment_prepare = $mysqli->prepare($payments);

    $prepare->execute();
    $settings_prepare->execute();
    $payment_prepare->execute();

    /* Log This Operation */
    include('../functions/logs.php');
    if ($prepare && $settings_prepare && $payment_prepare) {
        $success = "Store Registered";
    } else {
        $err = "Failed!, Please Try Again";
    }
}

/* Update Store */
if (isset($_POST['update_store'])) {
    $store_id = mysqli_real_escape_string($mysqli, $_POST['store_id']);
    $store_name = mysqli_real_escape_string($mysqli, $_POST['store_name']);
    $store_adr = mysqli_real_escape_string($mysqli, $_POST['store_adr']);
    $store_email = mysqli_real_escape_string($mysqli, $_POST['store_email']);
    /* Log Attributes */
    $log_type = "Stores Management Logs";
    $log_details = "Updated " . $store_name . " Details";

    /* Persist */
    $sql = "UPDATE store_settings SET store_name = '{$store_name}', store_adr = '{$store_adr}', store_email = '{$store_email}'
    WHERE store_id = '{$store_id}'";
    $prepare = $mysqli->prepare($sql);
    $prepare->execute();
    /* Log This Operation */
    include('../functions/logs.php');
    if ($prepare) {
        $success = "Store Details Updated";
    } else {
        $err = "Failed!, Please Try Again";
    }
}

/* Delete Store */
if (isset($_POST['delete_store'])) {
    $store_id = mysqli_real_escape_string($mysqli, $_POST['store_id']);
    $store_name = mysqli_real_escape_string($mysqli, $_POST['store_name']);
    $store_status = mysqli_real_escape_string($mysqli, 'closed');
    $store_close_date = mysqli_real_escape_string($mysqli, date('d M Y'));
    $user_id = mysqli_real_escape_string($mysqli, $_SESSION['user_id']);
    $user_password = sha1(md5(mysqli_real_escape_string($mysqli, $_POST['user_password'])));

    /* Log Attributes */
    $log_type = "Stores Management Logs";
    $log_details = "Closed " . $store_name;

    /* Check Of This User Password Really Adds Up */
    $sql = "SELECT * FROM  users  WHERE user_id = '{$user_id}'";
    $res = mysqli_query($mysqli, $sql);
    if (mysqli_num_rows($res) > 0) {
        $row = mysqli_fetch_assoc($res);
        if ($user_password != $row['user_password']) {
            $err = "Please Enter Correct Password";
        } else {
            /* Persist */
            $sql = "UPDATE store_settings SET store_status = '{$store_status}', store_close_date = '{$store_close_date}'
            WHERE store_id = '{$store_id}'";
            $prepare = $mysqli->prepare($sql);
            $prepare->execute();
            /* Log This Operation */
            include('../functions/logs.php');
            if ($prepare) {
                $success  = "Store Closed";
            } else {
                $err = "Failed!, Please Try Again";
            }
        }
    }
}

/* Re Open Store */
if (isset($_POST['re_open'])) {
    $store_id = mysqli_real_escape_string($mysqli, $_POST['store_id']);
    $store_name = mysqli_real_escape_string($mysqli, $_POST['store_name']);
    $store_status = mysqli_real_escape_string($mysqli, 'active');
    $store_close_date = mysqli_real_escape_string($mysqli, date('d M Y'));
    $user_id = mysqli_real_escape_string($mysqli, $_SESSION['user_id']);
    $user_password = sha1(md5(mysqli_real_escape_string($mysqli, $_POST['user_password'])));

    /* Log Attributes */
    $log_type = "Stores Management Logs";
    $log_details = "Re Opened " . $store_name;

    /* Check Of This User Password Really Adds Up */
    $sql = "SELECT * FROM  users  WHERE user_id = '{$user_id}'";
    $res = mysqli_query($mysqli, $sql);
    if (mysqli_num_rows($res) > 0) {
        $row = mysqli_fetch_assoc($res);
        if ($user_password != $row['user_password']) {
            $err = "Please Enter Correct Password";
        } else {
            /* Persist */
            $sql = "UPDATE store_settings SET store_status = '{$store_status}', store_close_date = ''
            WHERE store_id = '{$store_id}'";
            $prepare = $mysqli->prepare($sql);
            $prepare->execute();
            /* Log This Operation */
            include('../functions/logs.php');
            if ($prepare) {
                $success  = "Store Opened";
            } else {
                $err = "Failed!, Please Try Again";
            }
        }
    }
}
require_once('../partials/head.php');
?>

<body class="nk-body bg-lighter npc-general has-sidebar ">
    <div class="nk-app-root">
        <!-- main @s -->
        <div class="nk-main ">
            <!-- sidebar @s -->
            <?php require_once('../partials/sidebar.php'); ?>
            <!-- sidebar @e -->
            <!-- wrap @s -->
            <div class="nk-wrap ">
                <!-- main header @s -->
                <?php require_once('../partials/header.php'); ?>
                <!-- main header @e -->
                <!-- content @s -->
                <div class="nk-content ">
                    <div class="container-fluid">
                        <div class="nk-content-inner">
                            <div class="nk-content-body">
                                <div class="nk-block-head nk-block-head-sm">
                                    <div class="nk-block-between">
                                        <div class="nk-block-head-content">
                                            <h3 class="nk-block-title page-title">Stores</h3>
                                            <div class="nk-block-des text-soft">
                                                <p>Manage Your Organizations Stores Details.</p>
                                            </div>
                                        </div><!-- .nk-block-head-content -->
                                        <div class="nk-block-head-content">
                                            <div class="toggle-wrap nk-block-tools-toggle">
                                                <a href="#" class="btn btn-icon btn-trigger toggle-expand mr-n1" data-target="pageMenu"><em class="icon ni ni-menu-alt-r"></em></a>
                                                <div class="toggle-expand-content" data-content="pageMenu">
                                                    <ul class="nk-block-tools g-3">
                                                        <li><a href="#create_store" data-toggle="modal" class="btn btn-white btn-outline-light"><em class="icon ni ni-file-plus-fill"></em><span>Add New Store</span></a></li>
                                                    </ul>
                                                </div>
                                            </div><!-- .toggle-wrap -->
                                        </div><!-- .nk-block-head-content -->
                                    </div><!-- .nk-block-between -->
                                </div><!-- .nk-block-head -->
                                <!-- Add Store Modal -->
                                <div class="modal fade" id="create_store">
                                    <div class="modal-dialog  modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Fill All Required Fields</h4>
                                                <button type="button" class="close" data-dismiss="modal">
                                                    <span>&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" enctype="multipart/form-data">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label>Store Name</label>
                                                            <input type="text" name="store_name" required class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label>Store Email</label>
                                                            <input type="text" name="store_email" required class="form-control">
                                                        </div>
                                                        <div class="form-group col-md-12">
                                                            <label>Store Address</label>
                                                            <textarea type="text" name="store_adr" rows="3" required class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                    <br><br>
                                                    <div class="text-right">
                                                        <button name="create_store" class="btn btn-primary" type="submit">
                                                            <em class="icon ni ni-list-check"></em> Create Store
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Modal -->
                                <div class="">
                                    <div class="row">
                                        <?php
                                        /* Pop All Registered Stores */
                                        $raw_results = mysqli_query($mysqli, "SELECT * FROM store_settings ORDER BY store_status ASC");
                                        if (mysqli_num_rows($raw_results) > 0) {
                                            while ($stores = mysqli_fetch_array($raw_results)) {
                                                /* Status Borders */
                                                if ($stores['store_status'] == 'active') {
                                                    $border = 'border border-success';
                                                } else {
                                                    $border = 'border border-danger';
                                                }
                                        ?>
                                                <div class="card mb-3 col-md-6 <?php echo $border; ?>">
                                                    <div class="row no-gutters">
                                                        <div class="col-md-4">
                                                            <img src="../public/images/store.png" alt="...">
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="card-body">
                                                                <h5 class="card-title">
                                                                    <?php echo $stores['store_name'];
                                                                    if ($stores['store_status'] == 'active') { ?>
                                                                        <span class="badge badge-dim badge-pill badge-outline-success">Active</span>
                                                                    <?php } else { ?>
                                                                        <span class="badge badge-dim badge-pill badge-outline-danger">Closed</span>
                                                                    <?php } ?>
                                                                </h5>
                                                                <p class="card-text">Store Email: <?php echo $stores['store_email']; ?></p>
                                                                <p class="card-text">Store Address: <?php echo $stores['store_adr']; ?></p>
                                                                <p class="card-text">
                                                                    <a href="store_dashboard?view=<?php echo $stores['store_id']; ?>" class="badge badge-dim badge-pill badge-outline-success">View Store</a>
                                                                    <?php
                                                                    if ($stores['store_status'] == 'active') { ?>
                                                                        <a data-toggle="modal" href="#update_store_<?php echo $stores['store_id']; ?>" class="badge badge-dim badge-pill badge-outline-warning">Update</a>
                                                                        <a data-toggle="modal" href="#delete_store_<?php echo $stores['store_id']; ?>" class="badge badge-dim badge-pill badge-outline-danger">Close</a>
                                                                    <?php } else { ?>
                                                                        <a data-toggle="modal" href="#re_open_<?php echo $stores['store_id']; ?>" class="badge badge-dim badge-pill badge-outline-primary">Re Open</a>
                                                                    <?php } ?>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Load Modals Via Helpers -->
                                                <?php require('../helpers/modals/stores_modals.php'); ?>
                                            <?php }
                                        } else { ?>
                                            <div class="card mb-3 col-md-6 border border-danger">
                                                <div class="row no-gutters">
                                                    <div class="col-md-4">
                                                        <img src="../public/images/no_store.png" alt="...">
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="card-body">
                                                            <h5 class="card-title">
                                                                No Registered Stores.
                                                            </h5>
                                                            <p class="card-text">
                                                                To manage your stores, kindly create a store first.
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div><!-- .nk-block -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content @e -->
                <!-- footer @s -->
                <?php require_once('../partials/footer.php'); ?>
                <!-- footer @e -->
            </div>
            <!-- wrap @e -->
        </div>
        <!-- main @e -->
    </div>
    <!-- app-root @e -->
    <!-- JavaScript -->
    <?php require_once('../partials/scripts.php'); ?>
</body>

</html>