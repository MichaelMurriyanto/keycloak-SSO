<?php
header('Content-Type: application/json');

$input = json_decode(file_get_contents("php://input"), true);

if (!$input || !isset($input['sub'])) {
    echo json_encode(["status" => "error", "message" => "Invalid data"]);
    exit;
}

$sub = $input['sub'];
$jenis_klinik = $input['jenis_klinik'];
$dokter = $input['dokter'];
$tanggal = $input['tanggal'];
$waktu = $input['waktu'];
$keluhan = $input['keluhan'];

$mysqli = new mysqli("localhost", "root", "", "rumahsakit");

if ($mysqli->connect_error) {
    echo json_encode(["status" => "error", "message" => "Database connection failed"]);
    exit;
}

// Get nik and no_bpjs from user table
$query = "SELECT nik, no_bpjs FROM user WHERE sub = ?";
$stmt = $mysqli->prepare($query);
$stmt->bind_param("s", $sub);
$stmt->execute();
$stmt->bind_result($nik, $no_bpjs);
$stmt->fetch();
$stmt->close();

if (!$nik || !$no_bpjs) {
    echo json_encode(["status" => "error", "message" => "User data not found"]);
    exit;
}

// Generate no_rekam_medis and no_rawat_jalan
$no_rekam_medis = substr($nik, 0, 4) . substr($no_bpjs, 0, 4);
$random_number = sprintf("%04d", mt_rand(0, 9999));
$no_rawat_jalan = substr($no_rekam_medis, 0, 6) . $random_number;

$query = "INSERT INTO rawat_jalan (sub, no_rekam_medis, jenis_klinik, dokter, tanggal, waktu, keluhan, no_rawat_jalan) 
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
$stmt = $mysqli->prepare($query);
$stmt->bind_param("ssssssss", $sub, $no_rekam_medis, $jenis_klinik, $dokter, $tanggal, $waktu, $keluhan, $no_rawat_jalan);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "Data saved successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to save data"]);
}

$stmt->close();
$mysqli->close();
?>
