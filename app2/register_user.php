<?php
$host = 'localhost';
$username = 'root';
$password = '';
$database_bpjs = 'bpjs';

$sub = $_POST['sub'] ?? null;

if ($sub) {
    $conn = new mysqli($host, $username, $password, $database_bpjs);

    if ($conn->connect_error) {
        die("Koneksi gagal: " . $conn->connect_error);
    }

    // Cek apakah pengguna sudah memiliki `kelas_bpjs`, `faskes`, atau `No_bpjs`
    $query = "SELECT nik, no_kk, kelas_bpjs, faskes, No_bpjs FROM users WHERE sub = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $sub);
    $stmt->execute();
    $result = $stmt->get_result();
    $user_data = $result->fetch_assoc();

    if ($user_data) {
        // Periksa apakah `kelas_bpjs`, `faskes`, atau `No_bpjs` sudah terisi
        if (!empty($user_data['kelas_bpjs']) && !empty($user_data['faskes']) && !empty($user_data['No_bpjs'])) {
            echo json_encode(["success" => false, "message" => "Registrasi sudah pernah dilakukan."]);
        } else {
            // Cek apakah `nik` dan `no_kk` memiliki nilai
            if (!empty($user_data['nik']) && !empty($user_data['no_kk'])) {
                // Mengisi `kelas_bpjs` dan `faskes` secara acak antara '01', '02', '03'
                $kelas_bpjs = str_pad(rand(1, 3), 2, "0", STR_PAD_LEFT);
                $faskes = str_pad(rand(1, 3), 2, "0", STR_PAD_LEFT);

                // Membuat `No_bpjs` berdasarkan kombinasi yang diberikan
                $no_bpjs = substr($user_data['nik'], 0, 3) . substr($user_data['no_kk'], 0, 3) . $kelas_bpjs . $faskes . $user_data['sub'];

                // Update data di database
                $update_query = "UPDATE users SET kelas_bpjs = ?, faskes = ?, No_bpjs = ? WHERE sub = ?";
                $stmt_update = $conn->prepare($update_query);
                $stmt_update->bind_param("ssss", $kelas_bpjs, $faskes, $no_bpjs, $sub);
                $stmt_update->execute();

                echo json_encode(["success" => true, "message" => "Registrasi berhasil.", "kelas_bpjs" => $kelas_bpjs, "faskes" => $faskes, "No_bpjs" => $no_bpjs]);
            } else {
                // Jika `nik` atau `no_kk` tidak ada, set `kelas_bpjs`, `faskes`, dan `No_bpjs` menjadi `null`
                $update_query = "UPDATE users SET kelas_bpjs = NULL, faskes = NULL, No_bpjs = NULL WHERE sub = ?";
                $stmt_update = $conn->prepare($update_query);
                $stmt_update->bind_param("s", $sub);
                $stmt_update->execute();

                echo json_encode(["success" => false, "message" => "Registrasi gagal: `nik` atau `no_kk` tidak ada."]);
            }
        }
    } else {
        echo json_encode(["success" => false, "message" => "Pengguna tidak ditemukan."]);
    }

    // Menutup koneksi
    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["success" => false, "message" => "Sub tidak valid."]);
}
?>
