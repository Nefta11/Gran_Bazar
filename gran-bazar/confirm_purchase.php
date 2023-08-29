<?php
session_start();

require 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_SESSION['user_id'];

    try {
        $pdo->beginTransaction();

        $stmt = $pdo->prepare('SELECT PRODUCTO_ID FROM tbb_sistema_de_apartado WHERE USUARIO_ID = ? AND ESTATUS = 1');
        $stmt->execute([$user_id]);
        $products_to_confirm = $stmt->fetchAll();

        foreach ($products_to_confirm as $product) {
            $stmt = $pdo->prepare('UPDATE tbb_inventarios SET CANTIDAD_DISPONIBLE = CANTIDAD_DISPONIBLE - 1 WHERE PRODUCTO_ID = ? AND CANTIDAD_DISPONIBLE > 0');
            $stmt->execute([$product['PRODUCTO_ID']]);
            
            if ($stmt->rowCount() == 0) {
                throw new Exception('No hay suficiente stock del producto con ID: ' . $product['PRODUCTO_ID']);
            }
        }

        // Actualizamos el estado de los productos confirmados a "no activo" o "0".
        $stmt = $pdo->prepare('UPDATE tbb_sistema_de_apartado SET ESTATUS = 0 WHERE USUARIO_ID = ? AND ESTATUS = 1');
        $stmt->execute([$user_id]);

        $pdo->commit();
        
        $_SESSION['success_message'] = "¡Su apartado se ha realizado exitosamente!";
        
        header('Location: carrito.php'); // Redireccionamos al carrito.
        exit;

    } catch (Exception $e) {
        $pdo->rollBack();
        $_SESSION['error_message'] = "Hubo un error al confirmar el apartado: " . $e->getMessage();
        header('Location: carrito.php'); // Redireccionamos al carrito en caso de error.
        exit;
    }
}
?>
