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

/* Update Receipt Header And Footer */
if (isset($_POST['update_system_settings'])) {
    $system_name = mysqli_real_escape_string($mysqli, $_POST['system_name']);
    $system_tagline = mysqli_real_escape_string($mysqli, $_POST['system_tagline']);
    $system_timezone_id  = mysqli_real_escape_string($mysqli, $_POST['system_timezone_id']);

    /* Log Attributes */
    $log_type = "Settings & Configurations Logs";
    $log_details = "Edited Core System Customizations";

    /* Persist */
    $sql = "UPDATE system_settings SET system_name = '{$system_name}', system_tagline = '{$system_tagline}', system_timezone_id  = '{$system_timezone_id}'";
    $prepare = $mysqli->prepare($sql);
    $prepare->execute();
    /* Load Logs */
    include('../functions/logs.php');
    if ($prepare) {
        $success = "Updated System Settings";
    } else {
        $err = "Failed!, Please Try Again";
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
                                            <h3 class="nk-block-title page-title">System Customizations</h3>
                                            <div class="nk-block-des text-soft">
                                                <p>This module allows you to customize system name and taglines</p>
                                            </div>
                                        </div><!-- .nk-block-head-content -->
                                    </div><!-- .nk-block-between -->
                                </div><!-- .nk-block-head -->
                                <div class="nk-block">
                                    <div class="row g-gs">

                                        <div class="col-12">
                                            <div class="card card-bordered h-100 border border-success">
                                                <div class="card-inner">
                                                    <div class="timeline">
                                                        <form method="post" enctype="multipart/form-data">
                                                            <?php
                                                            /*  */
                                                            $ret = "SELECT * FROM system_settings ss 
                                                            INNER JOIN timezones t ON t.timezone_id = ss.system_timezone_id
                                                            ";
                                                            $stmt = $mysqli->prepare($ret);
                                                            $stmt->execute(); //ok
                                                            $res = $stmt->get_result();
                                                            while ($sys = $res->fetch_object()) {
                                                            ?>
                                                                <div class="form-row">
                                                                    <div class="form-group col-md-12">
                                                                        <label>System Default Timezone</label>
                                                                        <select type="text" required name="system_timezone_id" class="form-select form-control form-control-lg" data-search="on">
                                                                            <option value="<?php echo $sys->timezone_id; ?>"><?php echo $sys->timezone_name . ' ' . $sys->timezone_utcoffset; ?></option>
                                                                            <?php
                                                                            $timezones_sql = mysqli_query(
                                                                                $mysqli,
                                                                                "SELECT * FROM timezones 
                                                                                WHERE timezone_id != '{$sys->system_timezone_id}'
                                                                                ORDER BY timezone_name ASC"
                                                                            );
                                                                            if (mysqli_num_rows($timezones_sql) > 0) {
                                                                                while ($timezones = mysqli_fetch_array($timezones_sql)) { ?>
                                                                                    <option value="<?php echo $timezones['timezone_id']; ?>">
                                                                                        <?php echo $timezones['timezone_name'] . ' ' . $timezones['timezone_utcoffset']; ?>
                                                                                    </option>
                                                                            <?php }
                                                                            } ?>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label>System Name</label>
                                                                        <textarea type="text" required name="system_name" rows="2" class="form-control"><?php echo $sys->system_name; ?></textarea>
                                                                    </div>

                                                                    <div class="form-group col-md-6">
                                                                        <label>System Tagline</label>
                                                                        <textarea type="text" name="system_tagline" rows="2" class="form-control"><?php echo $sys->system_tagline; ?></textarea>
                                                                    </div>
                                                                </div>
                                                            <?php } ?>
                                                            <br>
                                                            <div class="text-right">
                                                                <button name="update_system_settings" class="btn btn-primary" type="submit">
                                                                    <em class="icon ni ni-update"></em> Update Configurations
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div><!-- .card -->
                                        </div><!-- .col -->
                                    </div>
                                </div>
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
    <?php
    require_once('../partials/scripts.php');
    ?>
</body>

</html>