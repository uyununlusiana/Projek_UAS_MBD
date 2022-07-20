<?php
// mengaktifkan session php
session_start();

// menghubungkan dengan koneksi
include '../config/koneksi.php';

// menangkap data yang dikirim dari form
$username = $_POST['username'];
$password = md5($_POST['password']);

// menyeleksi data user dengan username dan password yang sesuai
$result = mysqli_query($koneksi, "SELECT * FROM registrasi where username='$username' and password='$password'");

$cek = mysqli_num_rows($result);

if ($cek > 0) {
    $data = mysqli_fetch_array($result);
    if($data ['status']=="admin"){
    $_SESSION['username'] = $username;
    $_SESSION['nama_lengkap'] = $data['nama_lengkap'];
    $_SESSION['alamat'] = $data['alamat'];
    $_SESSION['tlp'] = $data['tlp'];
    $_SESSION['jk'] = $data['jk'];
    $_SESSION['status'] = "sudah_login";
    $_SESSION['id_registrasi'] = $data['id_registrasi'];
    header("location:../admin/dashboard.php");   
    }else if($data['status']=="user"){
    $_SESSION['username'] = $username;
    $_SESSION['nama_lengkap'] = $data['nama_lengkap'];
    $_SESSION['alamat'] = $data['alamat'];
    $_SESSION['tlp'] = $data['tlp'];
    $_SESSION['jk'] = $data['jk'];
    $_SESSION['status'] = "sudah_login";
    $_SESSION['id_registrasi'] = $data['id_registrasi'];
    header("location:../login/dashboard.php");   
    
} else {
   header("location:login.php?pesan=gagal login data tidak ditemukan.");
}

} else {
    echo mysqli_error($koneksi);
    //header("location:login.php?pesan=gagal login data tidak ditemukan.");
}

?>