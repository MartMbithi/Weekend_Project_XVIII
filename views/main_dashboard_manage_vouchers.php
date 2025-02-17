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
include '../vendor/autoload.php';
check_login();
/* Load Header Partial */
if (isset($_POST['redeem_points'])) {
    $view = mysqli_real_escape_string($mysqli, $_POST['view']);
    $code = mysqli_real_escape_string($mysqli, $_POST['code']);
    $store = mysqli_real_escape_string($mysqli, $_POST['store']);
    $amount = mysqli_real_escape_string($mysqli, $_POST['amount']);
    header("Location: main_dashboard_generate_voucher?view=$view&code=$code&amount=$amount&store=$store");
}
require_once('../partials/head.php')
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
                                            <h3 class="nk-block-title page-title">Credited Loyalty Points</h3>
                                            <div class="nk-block-des text-soft">
                                                <p>
                                                    This module allows you to manage your credited loyalty points to your loyal customers
                                                </p>
                                            </div>
                                        </div><!-- .nk-block-head-content -->
                                    </div><!-- .nk-block-between -->
                                </div><!-- .nk-block-head -->
                                <div class="">
                                    <div class="row">
                                        <div class="card mb-3 col-md-12 border border-success">
                                            <div class="card-body">
                                                <table class="datatable-init table">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Customer Name</th>
                                                            <th>Customer Contacts</th>
                                                            <th>Loyalty PTS</th>
                                                            <th>PTS Worth</th>
                                                            <th>Manage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                        $ret = "SELECT * FROM loyalty_points";
                                                        $stmt = $mysqli->prepare($ret);
                                                        $stmt->execute(); //ok
                                                        $res = $stmt->get_result();
                                                        while ($points = $res->fetch_object()) {
                                                        ?>
                                                            <tr>
                                                                <td><?php echo $points->loyalty_points_code; ?></td>
                                                                <td><?php echo $points->loyalty_points_customer_name; ?></td>
                                                                <td><?php echo $points->loyalty_points_customer_phone_no; ?></td>
                                                                <td><?php echo $points->loyalty_points_count; ?></td>
                                                                <td>
                                                                    <?php include('../functions/vouchers_generator.php'); ?>
                                                                </td>
                                                                <td>
                                                                    <?php if ($amount == "Ksh " . number_format(0, 2)) { ?>
                                                                        <span class="badge badge-dim badge-pill badge-outline-danger"><em class="icon ni ni-cc-off"></em> Low Points</span>
                                                                    <?php } else { ?>
                                                                        <!-- Load A Modal To Select Store Where This Points Has Been Redeemed -->
                                                                        <a data-toggle="modal" href="#redeem_<?php echo $points->loyalty_points_id; ?>" class="badge badge-dim badge-pill badge-outline-success">
                                                                            <em class="icon ni ni-cc-new"></em>
                                                                            Redeem Points
                                                                        </a>
                                                                        <!-- Load Modal -->
                                                                        <div class="modal fade" id="redeem_<?php echo $points->loyalty_points_id; ?>">
                                                                            <div class="modal-dialog  modal-lg">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h4 class="modal-title">Redeem Points - Select A Store To Redeem Points To</h4>
                                                                                        <button type="button" class="close" data-dismiss="modal">
                                                                                            <span>&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <form method="post" enctype="multipart/form-data">
                                                                                            <div class="form-row">
                                                                                                <div class="form-group col-md-12">
                                                                                                    <label>Items Store</label>
                                                                                                    <div class="form-group">
                                                                                                        <!-- Hidden Values -->
                                                                                                        <input name="view" value="<?php echo $points->loyalty_points_id; ?>" type="hidden">
                                                                                                        <input name="code" value="<?php echo $points->loyalty_points_code; ?>" type="hidden">
                                                                                                        <input name="amount" value="<?php echo $amount; ?>" type="hidden">
                                                                                                        <div class="form-control-wrap">
                                                                                                            <select name="store" class="form-select form-control form-control-lg" data-search="on">
                                                                                                                <?php
                                                                                                                $raw_results = mysqli_query($mysqli, "SELECT * FROM store_settings WHERE store_status = 'active'");
                                                                                                                if (mysqli_num_rows($raw_results) > 0) {
                                                                                                                    while ($stores = mysqli_fetch_array($raw_results)) {
                                                                                                                ?>
                                                                                                                        <option value="<?php echo $stores['store_id']; ?>"><?php echo $stores['store_name']; ?></option>
                                                                                                                <?php }
                                                                                                                }
                                                                                                                ?>
                                                                                                            </select>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <br><br>
                                                                                            <div class="text-right">
                                                                                                <button name="redeem_points" class="btn btn-primary" type="submit">
                                                                                                    <em class="icon ni ni-list-check"></em> Redeem Points
                                                                                                </button>
                                                                                            </div>
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    <?php } ?>
                                                                </td>
                                                            </tr>
                                                        <?php
                                                        }
                                                        ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
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