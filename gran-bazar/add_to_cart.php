<?php
session_start();
require 'config.php';

$response = ["success" => false, "message" => "Operación no permitida."];

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['product_id']) && isset($_SESSION['user_id'])) {
    $product_id = $_POST['product_id'];
    $user_id = $_SESSION['user_id'];

    try {
        $stmt = $pdo->prepare('INSERT INTO tbb_sistema_de_apartado (USUARIO_ID, PRODUCTO_ID, ESTATUS, FECHA_ENTREGA_MAX) VALUES (?, ?, 1, DATE_ADD(NOW(), INTERVAL 7 DAY))');
        $stmt->execute([$user_id, $product_id]);
        
        $response["success"] = true;
        $response["message"] = "Producto añadido al carrito.";
    } catch (Exception $e) {
        $response["message"] = "Error detallado: " . $e->getMessage();
    }
}

echo json_encode($response);
?>
