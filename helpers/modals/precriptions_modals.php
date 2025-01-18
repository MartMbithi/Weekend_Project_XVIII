<!-- View Modal -->
<div class="modal fade" id="view_<?php echo $prescriptions->pres_id; ?>">
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Prescription Details</h4>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    <strong>Patient Name:</strong> <?php echo $prescriptions->pres_patient_name; ?><br>
                    <strong>Patient Email:</strong> <?php echo $prescriptions->pres_patient_email; ?><br>
                    <strong>Patient Phone:</strong> <?php echo $prescriptions->pres_patient_phoneno; ?><br>
                    <strong>Prescription:</strong> <?php echo $prescriptions->pres_details; ?><br>
                    <strong>Prescription Date:</strong> <?php echo date('d M Y g:ia', strtotime($prescriptions->pres_date)); ?><br>
                </p>
                <!-- Add Print Button -->
                <div class="text-right">
                    <a href="print_prescription?print=<?php echo $prescriptions->pres_id; ?>" class="btn btn-primary"><em class="icon ni ni-printer"></em> Print</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->



<!-- Udpate Modal -->
<div class="modal fade" id="update_<?php echo $prescriptions->pres_id; ?>">
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
                            <label>Patient Name</label>
                            <input type="text" name="pres_patient_name" value="<?php echo $prescriptions->pres_patient_name; ?>" required class="form-control">
                            <input type="hidden" name="pres_id" value="<?php echo $prescriptions->pres_id; ?>" required class="form-control">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Patient Email Address</label>
                            <input type="email" name="pres_patient_email" value="<?php echo $prescriptions->pres_patient_email; ?>" required class="form-control">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Patient Phone Number</label>
                            <input type="text" name="pres_patient_phoneno" value="<?php echo $prescriptions->pres_patient_phoneno; ?>" required class="form-control">
                        </div>
                        <div class="form-group col-md-12">
                            <label>Prescription</label>
                            <textarea type="text" name="pres_details" required class="form-control"><?php echo $prescriptions->pres_details; ?></textarea>
                        </div>
                    </div><br><br>
                    <div class="text-right">
                        <button name="Update_Prescription" class="btn btn-primary" type="submit">
                            <em class="icon ni ni-user-add"></em> Save
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Udpate Modal -->



<!-- Delete Modal -->
<div class="modal fade" id="delete_<?php echo $prescriptions->pres_id; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">CONFIRM DELETE</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <form method="POST">
                <div class="modal-body text-center ">
                    <h4 class="text-danger">
                        Delete This Prescription Record? <br>
                        This operation is delicate. Kindly enter your password to delete.
                    </h4>
                    <br>
                    <!-- Hide This -->
                    <input type="hidden" name="pres_id" value="<?php echo $prescriptions->pres_id; ?>">
                    <button type="button" class="text-center btn btn-success" data-dismiss="modal"><em class="icon ni ni-cross-round"></em> No</button>
                    <button type="submit" name="Delete_Prescription" class="text-center btn btn-danger"><em class="icon ni ni-trash-fill"></em> Yes Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Delete Modal -->