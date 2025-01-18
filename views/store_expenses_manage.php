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

/* Add Expense */
if (isset($_POST['Add_Expense'])) {
    $expense_store_id  = mysqli_real_escape_string($mysqli, $_POST['expense_store_id']);
    $expense_name = mysqli_real_escape_string($mysqli, $_POST['expense_name']);
    $expense_date = mysqli_real_escape_string($mysqli, $_POST['expense_date']);
    $expense_amount = mysqli_real_escape_string($mysqli, $_POST['expense_amount']);
    $expense_details = mysqli_real_escape_string($mysqli, $_POST['expense_details']);

    /* Log User Activity */
    $log_type = "Expenses Management";
    $log_details = "Added $expense_name Worth $expense_amount For $expense_date";

    include('../functions/logs.php');

    /* Persist */
    if (mysqli_query(
        $mysqli,
        "INSERT INTO expenses (expense_store_id, expense_name, expense_date, expense_amount, expense_details)
        VALUES('{$expense_store_id}', '{$expense_name}', '{$expense_date}', '{$expense_amount}', '{$expense_details}')"
    )) {
        $success = "Expense Added";
    } else {
        $err = "Please Try Again Or Try Later";
    }
}

/* Update Expense */
if (isset($_POST['Update_Expense'])) {
    $expense_id  = mysqli_real_escape_string($mysqli, $_POST['expense_id']);
    $expense_name = mysqli_real_escape_string($mysqli, $_POST['expense_name']);
    $expense_date = mysqli_real_escape_string($mysqli, $_POST['expense_date']);
    $expense_amount = mysqli_real_escape_string($mysqli, $_POST['expense_amount']);
    $expense_details = mysqli_real_escape_string($mysqli, $_POST['expense_details']);


    /* Log User Activity */
    $log_type = "Expenses Management";
    $log_details = "Updated $expense_name Worth $expense_amount For $expense_date";

    include('../functions/logs.php');
    /* Update */
    if (mysqli_query(
        $mysqli,
        "UPDATE expenses SET expense_name = '{$expense_name}', expense_date = '{$expense_date}', expense_amount = '{$expense_amount}', expense_details = '{$expense_details}'
        WHERE expense_id = '{$expense_id}'"
    )) {
        $success = "Expense Updated";
    } else {
        $err = "Please Try Again Or Try Later";
    }
}

/* Delete Expense */
if (isset($_POST['Delete_Expense'])) {
    $expense_id = mysqli_real_escape_string($mysqli, $_POST['expense_id']);
    $expense_name = mysqli_real_escape_string($mysqli, $_POST['expense_name']);
    $expense_amount = mysqli_real_escape_string($mysqli, $_POST['expense_amount']);
    $expense_date = mysqli_real_escape_string($mysqli, $_POST['expense_date']);

    /* Log User Activity */
    $log_type = "Expenses Management";
    $log_details = "Deleted $expense_name Worth $expense_amount For $expense_date";

    include('../functions/logs.php');


    /* Delete */
    if (mysqli_query($mysqli, "DELETE FROM expenses WHERE expense_id = '{$expense_id}'")) {
        $success = "Expense Deleted";
    } else {
        $err = "Please Try Again Or Try Later";
    }
}
require_once('../partials/head.php');
?>

<body class="nk-body npc-invest bg-lighter ">
    <div class="nk-app-root">
        <!-- wrap @s -->
        <div class="nk-wrap ">
            <!-- main header @s -->
            <?php require_once('../partials/store_header.php'); ?>
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
                                                <h4 class="nk-block-title fw-normal">Expenses Management Module</h4>
                                                <p>
                                                    This module allows you to expenses incurred in this store <br>
                                                </p>
                                            </div>
                                        </div>
                                    </div><!-- .nk-block-head-content -->
                                    <div class="nk-block-head-content">
                                        <div class="toggle-wrap nk-block-tools-toggle">
                                            <a href="#" class="btn btn-icon btn-trigger toggle-expand mr-n1" data-target="pageMenu"><em class="icon ni ni-menu-alt-r"></em></a>
                                            <div class="toggle-expand-content" data-content="pageMenu">
                                                <ul class="nk-block-tools g-3">
                                                    <li><a href="#create_store" data-toggle="modal" class="btn btn-white btn-outline-light"><em class="icon ni ni-grid-plus-fill"></em><span>Add Expense</span></a></li>
                                                </ul>
                                            </div>
                                        </div><!-- .toggle-wrap -->
                                    </div><!-- .nk-block-head-content -->
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
                                                            <div class="form-group col-md-12">
                                                                <label>Expense Name</label>
                                                                <input type="hidden" name="expense_store_id" value="<?php echo $_GET['view']; ?>" required class="form-control">
                                                                <input type="text" name="expense_name" required class="form-control">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label>Expense Amount</label>
                                                                <input type="number" name="expense_amount" required class="form-control">
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label>Expense Date</label>
                                                                <input type="date" name="expense_date" required class="form-control">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label>Expense Details</label>
                                                                <textarea type="text" rows="1" name="expense_details" class="form-control"></textarea>
                                                            </div>
                                                        </div><br><br>
                                                        <div class="text-right">
                                                            <button name="Add_Expense" class="btn btn-primary" type="submit">
                                                                <em class="icon ni ni-save"></em> Save
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- .nk-block-between -->
                            </div><!-- .nk-block-head -->
                            <div class="nk-block">
                                <div class="card mb-3 col-md-12 border border-success">
                                    <div class="card-body">
                                        <table class="datatable-init table">
                                            <thead>
                                                <tr>
                                                    <th>Expense Name</th>
                                                    <th>Date</th>
                                                    <th>Amount</th>
                                                    <th>Expenses Details</th>
                                                    <th>Manage</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $ret = "SELECT * FROM  expenses WHERE expense_store_id = '{$_GET['view']}'";
                                                $stmt = $mysqli->prepare($ret);
                                                $stmt->execute(); //ok
                                                $res = $stmt->get_result();
                                                while ($expenses = $res->fetch_object()) { ?>
                                                    <tr>
                                                        <td><?php echo $expenses->expense_name; ?></td>
                                                        <td><?php echo $expenses->expense_date; ?></td>
                                                        <td>Ksh <?php echo number_format($expenses->expense_amount, 2); ?></td>
                                                        <td><?php echo $expenses->expense_details; ?></td>
                                                        <td>
                                                            <a data-toggle="modal" href="#update_<?php echo $expenses->expense_id; ?>" class="badge badge-dim badge-pill badge-outline-warning"><em class="icon ni ni-edit"></em> Edit</a>
                                                            <a data-toggle="modal" href="#delete_<?php echo $expenses->expense_id; ?>" class="badge badge-dim badge-pill badge-outline-danger"><em class="icon ni ni-trash-fill"></em> Delete</a>
                                                        </td>
                                                    </tr>
                                                <?php include('../helpers/modals/expenses.php');
                                                }
                                                ?>
                                            </tbody>
                                        </table>
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
    <?php require_once('../partials/pos_footer.php');; ?>
    <!-- footer @e -->
    </div>
    <!-- wrap @e -->
    </div>
    <!-- app-root @e -->
    <!-- JavaScript -->
    <?php require_once('../partials/scripts.php'); ?>
</body>

</html>