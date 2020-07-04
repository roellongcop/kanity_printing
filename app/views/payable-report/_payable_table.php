<table class="table table-striped table-bordered tw40">
    <thead>
        <tr>
            <th>COMPANY NAME</th>
            <th>TRANSACTION</th>
            <th>DATE PAID</th>
            <th class="text-right">AMOUNT (₱)</th>
        </tr>
    </thead>
    <tbody>
        <?php if($payables): ?>
            <?php foreach ($payables as $p) : ?>
                <tr>
                    <td><?= $p['company_name'] ?></td>
                    <td><?= $p['transaction'] ?></td>
                    <td><?= date('m/d/Y', strtotime($p['date_paid'])) ?></td>
                    <td class="text-right"><?= number_format($p['amount'], 2) ?></td>
                </tr>
            <?php endforeach; ?>
            <tr>
                <td colspan="3">
                    <b>TOTAL AMOUNT</b>
                </td>
                <td class="text-right">
                    <b>
                        <?= number_format($total_payables, 2) ?>
                    </b>
                </td>
            </tr>
        <?php else: ?>
            <tr>
                <td colspan="4" class="text-center">No records found.</td>
            </tr>    
        <?php endif; ?>
    </tbody>
</table>