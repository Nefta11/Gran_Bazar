<?php
session_start();
require 'config.php';

$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare('SELECT tbb_productos.*, tbb_sistema_de_apartado.FECHA_ENTREGA_MAX FROM tbb_productos JOIN tbb_sistema_de_apartado ON tbb_productos.ID = tbb_sistema_de_apartado.PRODUCTO_ID WHERE tbb_sistema_de_apartado.USUARIO_ID = ? AND tbb_sistema_de_apartado.ESTATUS = 1');
$stmt->execute([$user_id]);
$products = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu Carrito</title>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&display=swap" rel="stylesheet">
    <style>

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
        :root {
            --primary-color: #514bf3;
            --secondary-color: #e7c13c;
            --background-color: #f4f6f5;
            --background-color-two: #f8edfd;
        }

        html {
            font-size: 62.5%;
            font-family: 'Josefin Sans', sans-serif;
            background-color: var(--background-color);
        }

        body {
            margin: 0;
            padding: 0;
        }

        h2 {
            font-size: 2.4rem;
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 2rem;
            border-bottom: 2px solid var(--secondary-color);
            padding-bottom: 1rem;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            font-size: 1.6rem;
            background-color: var(--background-color-two);
            margin-bottom: 1rem;
            padding: 1rem;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        button {
            background-color: var(--primary-color);
            color: #ffffff;
            font-size: 1.8rem;
            padding: 1rem 2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s ease;
            display: block;
            margin: 2rem auto 0;
        }

        button:hover {
            background-color: var(--secondary-color);
        }

        .home-link {
            display: block;
            font-size: 1.6rem;
            background-color: var(--primary-color);
            color: #ffffff;
            text-align: center;
            padding: 1rem;
            margin-bottom: 2rem;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
        }

        .home-link:hover {
            background-color: var(--secondary-color);
        }

        @media (min-width: 1024px) {
            .menu-desktop {
                display: flex;
            }
        }

        @media (max-width: 1023px) {
            .menu-mobile {
                display: flex;
            }
        }

        @media (max-width: 1135px) {
            .section {
                overflow-y: scroll;
            }
        }

        @media (max-width: 580px) {
            footer {
                flex-direction: column;
                width: 100%;
                height: 600px;
            }

            .two {
                margin-bottom: 40px;
                margin: 0 auto;
            }

            .footer-item__desktop {
                margin: 0 auto;
            }

            .footer-mobile {
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .footer-desktop {
                display: none;
            }
        }
    </style>
</head>
<body>
    <?php
    if (isset($_SESSION['success_message'])) {
        echo '<div class="success-message">' . $_SESSION['success_message'] . '</div>';
        unset($_SESSION['success_message']); // Limpiar el mensaje después de mostrarlo
    }
    if (isset($_SESSION['error_message'])) {
        echo '<div class="error-message">' . $_SESSION['error_message'] . '</div>';
        unset($_SESSION['error_message']); // Limpiar el mensaje después de mostrarlo
    }
    ?>

    <a href="index.php" class="home-link">Home</a>
    <h2>Tu Carrito</h2>
    <?php if (empty($products)): ?>
        <div class="error-message">¡El carrito está vacío!</div>
    <?php else: ?>
        <ul>
            <?php foreach ($products as $product): ?>
                <li>
                    <span><?php echo $product['NOMBRE']; ?> - <?php echo number_format($product['PRECIO'], 2); ?> $</span>
                    <span>Fecha máxima de entrega: <?php echo date("d/m/Y", strtotime($product['FECHA_ENTREGA_MAX'])); ?></span>
                </li>
            <?php endforeach; ?>
        </ul>
        <form action="confirm_purchase.php" method="post">
            <button type="submit">Confirmar Apartado</button>
        </form>
    <?php endif; ?>
</body>
</html>
