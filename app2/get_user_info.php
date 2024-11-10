<?php
// Koneksi ke database BPJS dan kependudukan
$host = 'localhost';
$username = 'root';
$password = '';
$database_kependudukan = 'kependudukan';
$database_bpjs = 'bpjs';

$sub = $_POST['sub'] ?? null;

if ($sub) {
    // Membuat koneksi ke database BPJS dan Kependudukan
    $conn_bpjs = new mysqli($host, $username, $password, $database_bpjs);
    $conn_kependudukan = new mysqli($host, $username, $password, $database_kependudukan);

    if ($conn_bpjs->connect_error || $conn_kependudukan->connect_error) {
        echo json_encode(["success" => false, "message" => "Koneksi database gagal."]);
        exit();
    }

    // Cek apakah pengguna dengan `sub` ada di database BPJS
    $query = "SELECT * FROM users WHERE sub = ?";
    $stmt = $conn_bpjs->prepare($query);
    $stmt->bind_param("s", $sub);
    $stmt->execute();
    $result = $stmt->get_result();
    $user_data_bpjs = $result->fetch_assoc();

    if ($user_data_bpjs) {
        // Jika pengguna ditemukan di database BPJS, cek data terbaru dari kependudukan
        $query_kependudukan = "SELECT nik, no_kk, nama, alamat, no_hp FROM users WHERE sub = ?";
        $stmt_kependudukan = $conn_kependudukan->prepare($query_kependudukan);
        $stmt_kependudukan->bind_param("s", $sub);
        $stmt_kependudukan->execute();
        $result_kependudukan = $stmt_kependudukan->get_result();
        $user_data_kependudukan = $result_kependudukan->fetch_assoc();

        if ($user_data_kependudukan) {
            // Cek apakah ada perubahan data kependudukan yang perlu di-update ke BPJS
            $needs_update = (
                $user_data_bpjs['nik'] !== $user_data_kependudukan['nik'] ||
                $user_data_bpjs['no_kk'] !== $user_data_kependudukan['no_kk'] ||
                $user_data_bpjs['nama'] !== $user_data_kependudukan['nama'] ||
                $user_data_bpjs['alamat'] !== $user_data_kependudukan['alamat'] ||
                $user_data_bpjs['no_hp'] !== $user_data_kependudukan['no_hp']
            );

            if ($needs_update) {
                // Update data BPJS dengan data terbaru dari kependudukan
                $update_query = "UPDATE users SET nik = ?, no_kk = ?, nama = ?, alamat = ?, no_hp = ? WHERE sub = ?";
                $stmt_update = $conn_bpjs->prepare($update_query);
                $stmt_update->bind_param(
                    "ssssss",
                    $user_data_kependudukan['nik'],
                    $user_data_kependudukan['no_kk'],
                    $user_data_kependudukan['nama'],
                    $user_data_kependudukan['alamat'],
                    $user_data_kependudukan['no_hp'],
                    $sub
                );
                $stmt_update->execute();
            }
        }

        // Ambil data yang sudah diperbarui dari database BPJS untuk ditampilkan
        $user_data_full = array_merge($user_data_bpjs, $user_data_kependudukan);

    } else {
        // Jika pengguna tidak ada di BPJS, ambil data dari kependudukan dan insert ke BPJS
        $query_kependudukan = "SELECT * FROM users WHERE sub = ?";
        $stmt_kependudukan = $conn_kependudukan->prepare($query_kependudukan);
        $stmt_kependudukan->bind_param("s", $sub);
        $stmt_kependudukan->execute();
        $result_kependudukan = $stmt_kependudukan->get_result();
        $user_data_kependudukan = $result_kependudukan->fetch_assoc();

        if ($user_data_kependudukan) {
            // Insert data kependudukan ke BPJS dengan kolom tambahan yang diset default
            $insert_query = "INSERT INTO users (sub, name, preferred_username, given_name, family_name, email, email_verified, nik, no_kk, nama, alamat, no_hp) 
                             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt_insert = $conn_bpjs->prepare($insert_query);
            $stmt_insert->bind_param(
                "ssssssissssi",
                $user_data_kependudukan['sub'],
                $user_data_kependudukan['name'],
                $user_data_kependudukan['preferred_username'],
                $user_data_kependudukan['given_name'],
                $user_data_kependudukan['family_name'],
                $user_data_kependudukan['email'],
                $user_data_kependudukan['email_verified'],
                $user_data_kependudukan['nik'],
                $user_data_kependudukan['no_kk'],
                $user_data_kependudukan['nama'],
                $user_data_kependudukan['alamat'],
                $user_data_kependudukan['no_hp']
            );
            $stmt_insert->execute();
            $user_data_full = $user_data_kependudukan;
        } else {
            $user_data_full = null;
        }
    }

    // Mengirimkan respons JSON
    echo json_encode($user_data_full ? ["success" => true, "data" => $user_data_full] : ["success" => false, "message" => "User tidak ditemukan di database BPJS atau Kependudukan."]);

    // Menutup koneksi dan statement
    $stmt->close();
    if (isset($stmt_kependudukan)) $stmt_kependudukan->close();
    if (isset($stmt_insert)) $stmt_insert->close();
    if (isset($stmt_update)) $stmt_update->close();
    $conn_bpjs->close();
    $conn_kependudukan->close();
} else {
    echo json_encode(["success" => false, "message" => "Sub tidak valid."]);
}
?>
