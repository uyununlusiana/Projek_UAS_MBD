<?php
session_start();
if ($_SESSION['status'] != "sudah_login") {
    //melakukan pengalihan
    header("location:../login/login.php");
}
include "../config/koneksi.php";
$id = $_GET['id'];
$query_1 = mysqli_query($koneksi, "SELECT id_produk, id_barang FROM pembayaran WHERE id_pembayaran=$id");
$rs_1 = mysqli_fetch_assoc($query_1);
$query_2 = mysqli_query($koneksi, "SELECT * FROM produk WHERE id_produk=$rs_1[id_produk]");
$rs_2 = mysqli_fetch_assoc($query_2);
$id_pembayaran = $rs_1['id_pembayaran'];
//$nama = $rs_2['nama_lengkap'];
//$tgl_lahir = $rs_2['tgl_lahir'];
//$alamat = $rs_2['alamat_rumah'];
//$tlp = $rs_2['no_tlp'];
//$nama_ibu = $rs_2['nama_ibu'];
//$nama_ayah = $rs_2['nama_ayah'];
//$pekerjaan_ayah = $rs_2['pekerjaan_ayah'];

$insert_data = mysqli_query($koneksi, "INSERT INTO pembayaran (id_pembayaran) VALUES ('$id_pembayaran')");

if ($insert_data) {
    header('location:data_pembayaran.php?pesan:Data Berhasil Di Simpan');
} else {
    echo ('ERROR' . mysqli_error($koneksi));
    //header('location:pembayaran.php?pesan=Data Gagal Di Simpan');
}
