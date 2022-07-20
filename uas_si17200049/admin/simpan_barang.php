<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
	// melakukan pengalihan
	header("location:../login/login.php");
}

include "../config/koneksi.php";
$id =$_POST['id_barang'];
$nama = $_POST['nama_barang'];
$jumlah = $_POST['jumlah'];

$insert_data = mysqli_query($koneksi, "UPDATE `barang` SET `nama_barang` = '$nama', `jumlah` = '$jumlah' WHERE `id_barang` = '$id' ");


if ($insert_data) {
	header('location:data_barang.php?pesan=Data Berhasil Di Simpan');
} else {
	echo mysqli_error($koneksi);
	//header('location:data_pengasuh.php?pesan=Data Gagal Di Simpan');
}