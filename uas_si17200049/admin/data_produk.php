<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
	// melakukan pengalihan
	header("location:../login/user.php");
}
include "../layout/header.php";
include "../config/koneksi.php";
$sql = mysqli_query($koneksi, "SELECT * FROM produk");

?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pd-2 mb-3 border-bottom">
	<hl class="h2">Data Produk</h1>
	</div>
	<?php if (isset($_GET['pesan'])) : ?>
	 <div class="alert alert-success" role="alert">
	 	<?php echo $_GET['pesan']; ?>
	 </div>
	 	<?php endif; ?>
	<!-- <canvas class="my-4 w-100" id="myChart" width="900" height="380">
</canvas> -->

	<!-- <h4>Data Jadwal Kegiatan</h4> -->
		<a href="tambah_produk.php" class="btn btn-sm btn-primary">Tambah Produk</button></a>
	<br> <br>
	<div class="table-responsive">
		<table class="table table-striped table-bordered display nowrap"id="excample" style="width: 100%">
			<thead class="table-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nama Produk</th>
					<th scope="col">Harga</th>
					<th scope="col">Aksi</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$no = 1;
				while ($rs = mysqli_fetch_assoc($sql)) : ?>
					<tr>
						<td><?= $no; ?></td>
						<td><?= $rs['nama_produk']; ?></td>
						<td><?= $rs['harga']; ?></td>
						<td>
						<a href="detail_produk.php" class="btn btn-info btn-sm">Detail Produk</a>
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
