<?php
session_start();

// Añadir cabeceras para prevenir el almacenamiento en caché
header("Cache-Control: no-cache, must-revalidate");
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");

require 'config.php';

// Verifica si el usuario ha iniciado sesión y recupera su nombre
if(isset($_SESSION['user_id'])){
    $user_id = $_SESSION['user_id'];
    $stmt = $pdo->prepare("SELECT nombre_usuario FROM tbb_usuarios WHERE persona_id = ?");
    $stmt->execute([$user_id]);
    $user = $stmt->fetch();
    
    if($user){
        $nombre_usuario = $user['nombre_usuario'];
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gran Bazar</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="niñas.css">
    <link rel="shortcut icon" href="Gran-Bazar-removebg-preview (2).png" type="image/x-icon">
</head>

<body>
    <header>
        <div class="menu-desktop">
            <div class="container-logo">
                <a href="index.php">
                    <img src="logo_gran_bazar.jpeg" alt="icono gran bazar">
                </a>
            </div>
            <div class="container-buttons">
                <h1 class="title-app">Niñas</h1>
                <ul class="list-buttons">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="mujeres.php">Mujeres</a>
                    </li>
                    <li>
                        <a href="ninas.php">Niñas</a>
                    </li>
                    <li>
                        <a href="cart.php" id="cart-link">
                        <i class="bx bxs-cart-alt card-icon"></i>
                        </a>
                    </li>

                    <li class="dropdown">
    <i class='bx bx-user card-icon'></i>
    <div class="dropdown-content">
        <?php if(isset($_SESSION['user_id'])): ?>
            <!-- Usuario ha iniciado sesión -->
            <a href=""><strong><?php echo $nombre_usuario; ?></strong></a>
            <a href="cerrar_secion.php">Cerrar sesión</a>
        <?php else: ?>
            <!-- Usuario no ha iniciado sesión -->
            <a href="login.php">Iniciar sesión</a>
            <a href="registro.php">Registrarse</a>
        <?php endif; ?>
    </div>
        </li>
                </ul>
            </div>
        </div>
        <div class="menu-mobile">
            <div class="container-bottom-menu menu-mobile__item">
                <i class='bx bx-menu menu-icon btn-mobile-menu'></i>
            </div>
            <div class="container-logo menu-mobile__item">
                <a href="index.php">
                    <img src="logo_gran_bazar.jpeg" alt="logo app">
                </a>
            </div>
            <div class="container-shopping-cart menu-mobile__item">
            <div class="container-shopping-cart menu-mobile__item" id="mobile-cart-icon">
                <a href="cart.php">
                <i class='bx bx-cart-alt menu-icon'></i>
                </a>
                </div> 
        </div>

        <div class="nav-menu">
    <?php
    if(isset($_SESSION['user_id'])):
        
    ?>
        <div class="user-information">
            <p class="user-name-nav-mobile">Hola <?php echo $nombre_usuario; ?></p>
            <button class="logout-button"><i class='bx bxs-log-out'></i><a href="cerrar_secion.php">Cerrar sesión</a></button>
        </div>
        <a href="index.php">Home</a>
        <a href="mujeres.php">Mujeres</a>
        <a href="ninas.php">Niñas</a>
    <?php else: ?>
        <a href="index.php">Home</a>
        <a href="mujeres.php">Mujeres</a>
        <a href="ninas.php">Niñas</a>
        <a href="login.php">Iniciar sesión</a>
        <a href="registro.php">Registrarse</a>
    <?php endif; ?>
</div>

    </header>
    <main>
<!-- Sección 1: Ofertas de HASTA un 80% -->
<?php
$stmt1 = $pdo->query('SELECT * FROM tbb_productos WHERE ESTATUS = 1 LIMIT 0,8');
$productos1 = $stmt1->fetchAll();
?>

<h1 class="title-section">Ofertas de HASTA un 80%</h1>
<section class="oferts section">
    <?php foreach ($productos1 as $producto): ?>
        <div class="product-card">
            <img src="<?php echo htmlspecialchars($producto['IMAGEN'], ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($producto['NOMBRE'], ENT_QUOTES, 'UTF-8'); ?>">
            <div class="product-card__info">
                <div class="information-product">
                    <h4 class="product-title"><?php echo $producto['NOMBRE']; ?></h4>
                    <p class="price"><?php echo number_format($producto['PRECIO'], 2); ?> $</p>
                    <div class="stars">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                </div>
                <div class="container-icon">
                <i class='bx bx-cart-add' data-product-id="<?php echo $producto['ID']; ?>"></i>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</section>

<!-- Sección 2: Lo más nuevo -->
<?php
 $stmt2 = $pdo->query('SELECT * FROM tbb_productos WHERE ESTATUS = 1 LIMIT 8,8');
$productos2 = $stmt2->fetchAll();
?>

<h2 class="title-section">Lo más nuevo</h2>
<section class="most-new section">
    <?php foreach ($productos2 as $producto): ?>
        <div class="product-card">
            <img src="<?php echo htmlspecialchars($producto['IMAGEN'], ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($producto['NOMBRE'], ENT_QUOTES, 'UTF-8'); ?>">
            <div class="product-card__info">
                <div class="information-product">
                    <h4 class="product-title"><?php echo $producto['NOMBRE']; ?></h4>
                    <p class="price"><?php echo number_format($producto['PRECIO'], 2); ?> $</p>
                    <div class="stars">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                </div>
                <div class="container-icon">
                <i class='bx bx-cart-add' data-product-id="<?php echo $producto['ID']; ?>"></i>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</section>

<!-- Sección 3: Lo más solicitado -->
<?php
$stmt3 = $pdo->query('SELECT * FROM tbb_productos WHERE ESTATUS = 1 LIMIT 16,8');
$productos3 = $stmt3->fetchAll();
?>

<h2 class="title-section">Lo más solicitado</h2>
<section class="most-requested section">
    <?php foreach ($productos3 as $producto): ?>
        <div class="product-card">
            <img src="<?php echo htmlspecialchars($producto['IMAGEN'], ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($producto['NOMBRE'], ENT_QUOTES, 'UTF-8'); ?>">
            <div class="product-card__info">
                <div class="information-product">
                    <h4 class="product-title"><?php echo $producto['NOMBRE']; ?></h4>
                    <p class="price"><?php echo number_format($producto['PRECIO'], 2); ?> $</p>
                    <div class="stars">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                </div>
                <div class="container-icon">
                <i class='bx bx-cart-add' data-product-id="<?php echo $producto['ID']; ?>"></i>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</section>

<!-- Sección 4: Lo más recomendado -->
<?php
$stmt4 = $pdo->query('SELECT * FROM tbb_productos WHERE ESTATUS = 1 LIMIT 24,8');
$productos4 = $stmt4->fetchAll();
?>

<h2 class="title-section">Lo más recomendado</h2>
<section class="recommended section">
    <?php foreach ($productos4 as $producto): ?>
        <div class="product-card">
            <img src="<?php echo htmlspecialchars($producto['IMAGEN'], ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($producto['NOMBRE'], ENT_QUOTES, 'UTF-8'); ?>">
            <div class="product-card__info">
                <div class="information-product">
                    <h4 class="product-title"><?php echo $producto['NOMBRE']; ?></h4>
                    <p class="price"><?php echo number_format($producto['PRECIO'], 2); ?> $</p>
                    <div class="stars">
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                        <i class='bx bxs-star'></i>
                    </div>
                </div>
                <div class="container-icon">
                <i class='bx bx-cart-add' data-product-id="<?php echo $producto['ID']; ?>"></i>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</section>


    </main>

    <footer>
        <section class="footer-desktop">
            <div class="footer-item__desktop">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4011.1913055687737!2d-97.9584259705053!3d20.238582122701505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2smx!4v1691865537809!5m2!1sen!2smx"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade" class="location"></iframe>
            </div>
            <div class="footer-item__desktop two">
                <p>Encuentranos en nuestras redes sociales</p>
                <div class="icons-footer-content">
                    <i class='bx bxl-facebook-square'></i> <br>
                    <i class='bx bxl-instagram-alt'></i> <br>
                    <i class='bx bxl-tiktok'></i>
                </div>
            </div>
        </section>

        <section class="footer-mobile">
            <div class="footer-item__desktop two">
                <p>Encuentranos en nuestras redes sociales</p>
                <div class="icons-footer-content">
                    <i class='bx bxl-facebook-square'></i> <br>
                    <i class='bx bxl-instagram-alt'></i> <br>
                    <i class='bx bxl-tiktok'></i>
                </div>
            </div>
            <p class="texto-footer-mobile">Visitanos</p>
            <div class="footer-item__desktop">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4011.1913055687737!2d-97.9584259705053!3d20.238582122701505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2smx!4v1691865537809!5m2!1sen!2smx"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade" class="location"></iframe>
            </div>
        </section>
    </footer>
    <script src="nav-bar.js"></script>
    
    <script>
var isAuthenticated = <?php echo isset($_SESSION['user_id']) ? 'true' : 'false'; ?>;

$(document).ready(function(){
    $('.bx-cart-add').click(function(){
        if (!isAuthenticated) {
            alert('Debe iniciar sesión para añadir productos al carrito.');
            return;
        }
        
        var producto_id = $(this).data('product-id');

        $.post('add_to_cart.php', { product_id: producto_id }, function(response) {
            if (response.success) {
                alert(response.message);
            } else {
                alert('Hubo un error al agregar el producto al carrito: ' + response.message);
            }
        }, 'json');
    });
});
</script>

<script>
        $(document).ready(function(){
    $('#cart-link, #mobile-cart-icon').on('click', function(e){
        <?php if(!isset($_SESSION['user_id'])): ?>
            e.preventDefault();
            alert("Necesitas iniciar sesión para acceder al carrito.");
        <?php endif; ?>
    });
});
</script>
</body>
</html>