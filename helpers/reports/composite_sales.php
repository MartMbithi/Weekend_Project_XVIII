<div class="card mb-3 col-12 border border-success">
    <div class="card-inner">
        <div class="nk-ck">
            <canvas class="line-chart" id="solidLineChart"></canvas>
        </div>
    </div>
</div><!-- .card-preview -->
<div class="card mb-3 col-12 border border-success">
    <div class="card-body">
        <h5 class="text-right">
            <a class="btn btn-primary" href="main_dashboard_system_sales_pdf_dump?from=<?php echo $_POST['start_date']; ?>&to=<?php echo $_POST['end_date']; ?>&type=<?php echo $_POST['sale_report_type']; ?>&store=<?php echo $_POST['store']; ?>&product=<?php echo $product_id; ?>&user=<?php echo $user_id; ?>"><em class="icon ni ni-file-docs"></em> Export To PDF</a>
            <a class="btn btn-primary" href="main_dashboard_system_sales_xls_dump?from=<?php echo $_POST['start_date']; ?>&to=<?php echo $_POST['end_date']; ?>&type=<?php echo $_POST['sale_report_type']; ?>&store=<?php echo $_POST['store']; ?>&product=<?php echo $product_id; ?>&user=<?php echo $user_id; ?>"><em class="icon ni ni-grid-add-fill-c"></em> Export To Excel</a>
        </h5>
        <div class="card-header">
            <h5 class="text-center text-primary">Composite Report Of All Posted Sales From <?php echo date(
                                                                                                'M d Y',
                                                                                                strtotime($start)
                                                                                            ) .
                                                                                                ' To ' .
                                                                                                date('M d Y', strtotime($end)); ?></h5>
        </div>
        <?php
        /* Show Customer Details If Its Allowed On Setings */
        $settings_sql = mysqli_query(
            $mysqli,
            "SELECT receipt_store_id ,  show_customer FROM receipt_customization WHERE receipt_store_id = '{$store}' AND show_customer = 'true'"
        );
        if (mysqli_num_rows($settings_sql) > 0) {
            while ($settings = mysqli_fetch_array($settings_sql)) { ?>
                <table class="table table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Sold By</th>
                            <th>Sold To</th>
                            <th>Date Sold</th>
                            <th>Unit Cost</th>
                            <th>Discount</th>
                            <th>Discounted Amt</th>
                            <th>QTY</th>
                            <th>Payment Means</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $ret = "SELECT * FROM sales s
                        INNER JOIN products p ON p.product_id = sale_product_id
                        INNER JOIN users us ON us.user_id = s.sale_user_id
                        WHERE  p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '{$start}' AND '{$end}'";
                        // Optional filtering
                        $conditions = [];

                        if ($product_id !== 'all') {
                            $conditions[] = "s.sale_product_id = '$product_id'";
                        }

                        if ($user_id !== 'all') {
                            $conditions[] = "s.sale_user_id = '$user_id'";
                        }

                        if (!empty($conditions)) {
                            $ret .=
                                'AND ' . implode(' AND ', $conditions) . ' ';
                        }

                        $ret .= 'ORDER BY sale_datetime ASC';
                        $stmt = $mysqli->prepare($ret);
                        $stmt->execute(); //ok
                        $res = $stmt->get_result();
                        $cumulative_income = 0;
                        while ($sales = $res->fetch_object()) {

                            /* Sale Amount  */
                            $sales_amount =
                                $sales->sale_quantity *
                                $sales->sale_payment_amount;
                            $discounted_price =
                                $sales->product_sale_price -
                                $sales->sale_discount;
                            $sale_datetime = new DateTime(
                                $sales->sale_datetime,
                                new DateTimeZone('UTC')
                            );
                            $offset_timezone = new DateTimeZone(
                                $timezone_offset
                            );
                            $sale_datetime->setTimezone($offset_timezone);
                            $formatted_time = $sale_datetime->format(
                                'd M Y g:ia'
                            );

                            /* Payment Means */
                            if ($sales->sale_payment_method == 'Credit') {
                                $payment_means =
                                    'Credit Sale <br> Payment Due On ' .
                                    date(
                                        'd M Y',
                                        strtotime(
                                            $sales->sale_credit_expected_date
                                        )
                                    );
                            } else {
                                $payment_means = $sales->sale_payment_method;
                            }
                        ?>
                            <tr>
                                <td><?php echo $sales->product_name; ?></td>
                                <td><?php echo $sales->user_name; ?></td>
                                <td><?php echo $sales->sale_customer_name; ?></td>
                                <td><?php echo $formatted_time; ?></td>
                                <td><?php echo 'Ksh ' .
                                        number_format(
                                            $sales->product_sale_price,
                                            2
                                        ); ?></td>
                                <td><?php echo 'Ksh ' .
                                        number_format(
                                            $sales->sale_discount,
                                            2
                                        ); ?></td>
                                <td><?php echo 'Ksh ' .
                                        number_format($discounted_price, 2); ?></td>
                                <td><?php echo $sales->sale_quantity; ?></td>
                                <td><?php echo $payment_means; ?></td>
                                <td>
                                    <?php
                                    echo 'Ksh ' .
                                        number_format($sales_amount, 2);
                                    $cumulative_income += $sales_amount;
                                    ?>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>
                        <tr>
                            <td colspan="9"><b>Total Amount:</b></td>
                            <td><b><?php echo 'Ksh ' .
                                        number_format(
                                            $cumulative_income,
                                            2
                                        ); ?></b></td>
                        </tr>
                    </tbody>
                </table>
            <?php }
        } else {
            ?>
            <table class="table table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Sold By</th>
                        <th>Date Sold</th>
                        <th>Unit Cost</th>
                        <th>Discount</th>
                        <th>Discounted Amt</th>
                        <th>QTY</th>
                        <th>Payment Means</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $ret = "SELECT * FROM sales s
                        INNER JOIN products p ON p.product_id = sale_product_id
                        INNER JOIN users us ON us.user_id = s.sale_user_id
                        WHERE  p.product_store_id = '{$store}' AND s.sale_datetime BETWEEN '{$start}' AND '{$end}'";
                    // Optional filtering
                    $conditions = [];

                    if ($product_id !== 'all') {
                        $conditions[] = "s.sale_product_id = '$product_id'";
                    }

                    if ($user_id !== 'all') {
                        $conditions[] = "s.sale_user_id = '$user_id'";
                    }

                    if (!empty($conditions)) {
                        $ret .= 'AND ' . implode(' AND ', $conditions) . ' ';
                    }

                    $ret .= 'ORDER BY sale_datetime ASC';
                    $stmt = $mysqli->prepare($ret);
                    $stmt->execute(); //ok
                    $res = $stmt->get_result();
                    $cumulative_income = 0;
                    while ($sales = $res->fetch_object()) {

                       5;

                        /* Sale Amount  */
                        $sales_amount =
                            $sales->sale_quantity * $sales->sale_payment_amount;
                        $discounted_price =
                            $sales->product_sale_price - $sales->sale_discount;
                        /* Payment Means */
                        if ($sales->sale_payment_method == 'Credit') {
                            $payment_means =
                                'Credit Sale <br> Payment Due On ' .
                                date(
                                    'd M Y',
                                    strtotime($sales->sale_credit_expected_date)
                                );
                        } else {
                            $payment_means = $sales->sale_payment_method;
                        }
                    ?>
                        <tr>
                            <td><?php echo $sales->product_name; ?></td>
                            <td><?php echo $sales->user_name; ?></td>
                            <td><?php echo $formatted_time; ?></td>
                            <td><?php echo 'Ksh ' .
                                    number_format(
                                        $sales->product_sale_price,
                                        2
                                    ); ?></td>
                            <td><?php echo 'Ksh ' .
                                    number_format($sales->sale_discount, 2); ?></td>
                            <td><?php echo 'Ksh ' .
                                    number_format($discounted_price, 2); ?></td>
                            <td><?php echo $sales->sale_quantity; ?></td>
                            <td><?php echo $payment_means; ?></td>
                            <td>
                                <?php
                                echo 'Ksh ' . number_format($sales_amount, 2);
                                $cumulative_income += $sales_amount;
                                ?>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                    <tr>
                        <td colspan="8"><b>Total Amount:</b></td>
                        <td><b><?php echo 'Ksh ' .
                                    number_format($cumulative_income, 2); ?></b></td>
                    </tr>
                </tbody>
            </table>
        <?php
        }
        ?>
    </div>
</div>