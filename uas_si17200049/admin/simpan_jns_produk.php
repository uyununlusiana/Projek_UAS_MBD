<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
	// melakukan pengalihan
	header("location:../login/user.php");
}
include "../config/koneksi.php";

$nama_jns_produk = $_POST['nama_jns_produk'];
$insert_data = mysqli_query($koneksi, "INSERT INTO jns_produk(nama_jns_produk) values('$nama_jns_produk')");
if ($insert_data) {
	header('location:data_jns_produk.php?pesan=Data Berhasil Disimpan');
} else {
	echo mysqli_error($koneksi);
	//header('location:data_jns_produk.php?pesan=Data Gagal Disimpan');

} 
