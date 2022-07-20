<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
    //melakukan pengalihan
    header("location:../login/admin.php");
}
include "../layout/header.php";
include "../config/koneksi.php";
$sql = mysqli_query($koneksi, "SELECT * FROM registrasi");

?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Data Pengguna</h1>
    </div>
    <?php if (isset($_GET['pesan'])) : ?>
        <div class="alert alert-success" role="alert">
            <?php echo $_GET['pesan']; ?>
        </div>
    <?php endif; ?>

    <!-- <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> -->
    <!-- <h4>Data Jadwal Kegiatan</h4> -->
    <!-- <a href="frm_tambah_pendaftar.php" class="btn btn-sm btn-primary">Tambah Data</a>
    <br><br> -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered display nowrap" id="example" style="width: 100%">

            <thead class="table-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nama Lengkap</th>
                    <th scope="col">NIK</th>
                    <th scope="col">Jenis Kelamin</th>
                    <th scope="col">Alamat</th>
                    <th scope="col">NO Tlp/Hp</th>
                    <th scope="col">Username</th>
                    <th scope="col">Password</th>
                    <th scope="col">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                while ($rs = mysqli_fetch_assoc($sql)) : ?>
                    <tr>
                        <td><?= $no; ?></td>
                        <td><?= $rs['nama_lengkap']; ?></td>
                        <td><?= $rs['nik']; ?></td>
                        <td><?= $rs['jk']; ?></td>
                        <td><?= $rs['alamat']; ?></td>
                        <td><?= $rs['tlp']; ?></td>
                        <td><?= $rs['username']; ?></td>
                        <td><?= $rs['password']; ?></td>
                        <td>
                            <a href="frm_ubah_data_registrasi.php" class="btn btn-info btn-sm">Ubah</a>
                            <a href="hapus_data_pengguna.php" class="btn btn-danger btn-sm">Hapus</a>
                        </td>
                    </tr>
                <?php
                    $no++;
                endwhile;
                ?>
            </tbody>
        </table>
    </div>
</main>

<?php
include "../layout/footer.php";
?>