<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
	// melakukan pengalihan
	header("location:../login/user.php");
}
include "../layout/header.php";
include "../config/koneksi.php";

?>
<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pd-2 mb-3 border-bottom">
	<hl class="h2">Form Jenis produk</h1>
	</div>

	<!-- <canvas class="my-4 w-100" id="myChart" width="900" height="380">
</canvas> -->

	<!-- <h4>Data Jadwal Kegiatan</h4> -->
<div class="table-responsive">
		<form action="simpan_jns_produk.php" method="POST">
			<div class="col-6">
				<div class="mb-3">
					<label for="excampleFormControlInputl" class="form-label">Nama jns produk</label>
					<input type="text" class="form-control" name="nama_jns_produk">	
				</div>
				<div class="mb-3">
					<button type="submit" class="btn btn-sm btn-primary">Simpan</button>
				</div>
			</div>
		</form>
	</div>
</main>
<?php
include "../layout/footer.php";
?>
	