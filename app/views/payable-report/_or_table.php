<table class="table table-striped table-bordered tw40">
    <thead>
        <tr>
            <th>SI NO</th>
            <th>OR NO</th>
            <th>DATE</th>
            <th class="text-right">AMOUNT (₱)</th>
        </tr>
    </thead>
    <tbody>
        <?php if($receivables): ?>
            <?php foreach ($receivables as $v) : ?>
                <tr>
                    <td><?= $v['si_no'] ?></td>
                    <td><?= $v['no'] ?></td>
                    <td><?= date('m/d/Y', strtotime($v['date'])) ?></td>
                    <td class="text-right"><?= number_format($v['total'], 2) ?></td>
                </tr>
            <?php endforeach; ?>
            <tr>
                <td colspan="3">
                    <b>TOTAL AMOUNT</b>
                </td>
                <td class="text-right">
                    <b>
                        <?= number_format($total_receivables, 2) ?>
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