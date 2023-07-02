<?= $this->extend('components/layout') ?>
<?= $this->section('content') ?>
<h1>User Management</h1>

<?php if (session()->getFlashdata('message')): ?>
    <div class="alert alert-success">
        <?= session()->getFlashdata('message') ?>
    </div>
<?php endif; ?>

<?php if (session()->getFlashdata('failed')): ?>
    <div class="alert alert-danger">
        <?= session()->getFlashdata('failed') ?>
    </div>
<?php endif; ?>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <?php $id = 1; // Inisialisasi ID ?>
    <?php foreach ($users as $user): ?>
    <tr>
        <td><?=$id++?></td>
        <td><?= $user['username'] ?></td>
        <td><?= $user['is_aktif'] ?></td>
        <td>
            <a href="<?= base_url('users/update/' . $user['id']) ?>">Activate</a>
        </td>
    </tr>
<?php endforeach; ?>
    </tbody>
</table>
<?= $this->endSection() ?>
