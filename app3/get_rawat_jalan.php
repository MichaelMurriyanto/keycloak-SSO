<?php
// Database configuration
$host = 'localhost';
$db_user = 'root';
$db_password = '';
$db_rumahsakit = 'rumahsakit';

// Retrieve the incoming JSON data
$requestData = json_decode(file_get_contents("php://input"), true);
$sub = $requestData['sub'] ?? null;

if ($sub) {
    try {
        // Connect to the rumahsakit database
        $pdo = new PDO("mysql:host=$host;dbname=$db_rumahsakit", $db_user, $db_password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Query rawat_jalan table for records with matching sub
        $stmt = $pdo->prepare("SELECT * FROM rawat_jalan WHERE sub = :sub");
        $stmt->execute([':sub' => $sub]);
        $rawatJalanData = $stmt->fetchAll(PDO::FETCH_ASSOC);

        echo json_encode(["status" => "success", "data" => $rawatJalanData]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => $e->getMessage()]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Invalid data: sub is missing."]);
}
?>
