<?php
session_start();
?>

<?php

require 'config.php';

$message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        $direccion = $_POST['direccion'];
        $ciudad = $_POST['ciudad'];
        $estado = $_POST['estado'];

        $stmt = $pdo->prepare("INSERT INTO tbb_ubicaciones (DIRECCION, CIUDAD, ESTADO) VALUES (?, ?, ?)");
        $stmt->execute([$direccion, $ciudad, $estado]);
        $ubicacion_id = $pdo->lastInsertId();

        $nombre = $_POST['nombre'];
        $primer_apellido = $_POST['primer_apellido'];

        // Comprobamos si el segundo apellido fue suministrado, de lo contrario lo establecemos a null
        $segundo_apellido = isset($_POST['segundo_apellido']) && !empty($_POST['segundo_apellido']) ? $_POST['segundo_apellido'] : null;

        $fecha_nacimiento = $_POST['fecha_nacimiento'];
        $genero = $_POST['genero'];

        $stmt = $pdo->prepare("INSERT INTO tbb_personas (NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, FECHA_NACIMIENTO, GENERO, UBICACION_ID) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->execute([$nombre, $primer_apellido, $segundo_apellido, $fecha_nacimiento, $genero, $ubicacion_id]);
        $persona_id = $pdo->lastInsertId();

        $nombre_usuario = $_POST['nombre_usuario'];
        $email = $_POST['email'];
        $contraseña = password_hash($_POST['contraseña'], PASSWORD_DEFAULT);
        $numero_telefonico = $_POST['numero_telefonico'];

        $stmt = $pdo->prepare("INSERT INTO tbb_usuarios (PERSONA_ID, NOMBRE_USUARIO, EMAIL, CONTRASEÑA, NUMERO_TELEFONICO) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$persona_id, $nombre_usuario, $email, $contraseña, $numero_telefonico]);
        
        echo "<script>alert('Registro exitoso!');</script>";
    } catch (PDOException $e) {
        echo "<script>alert('Hubo un error, por favor intenta nuevamente más tarde.');</script>";
    }
}

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>

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
    ;
}

header {
    width: 100%;
    height: 90px;
    box-shadow: -1px 1px 5px #e7c13c;
}
form {
    display: flex;
    flex-direction: column;
    max-width: 500px;
    margin: 0 auto;
    background-color: var(--background-color-two);
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    margin-top: 40px;
    text-align: center;
    margin-bottom: 20px;
    color: var(--primary-color);
    font-size: 2.0rem;
}

label {
    margin-bottom: 5px;
    font-size: 1.4rem;
    color: var(--primary-color);
}

input[type="text"],
input[type="date"],
input[type="email"],
input[type="password"],
input[type="tel"],
select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    font-size: 1.4rem;
    border: 1px solid var(--primary-color);
    border-radius: 5px;
    background-color: var(--background-color);
    outline: none;
    transition: border 0.3s ease;
}

input[type="text"]:focus,
input[type="date"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
input[type="tel"]:focus,
select:focus {
    border-color: var(--secondary-color);
}

button[type="submit"] {
    background-color: var(--primary-color);
    color: #ffffff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    font-size: 1.6rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
    background-color: var(--secondary-color);
}

.menu-desktop {
    display: none;
    justify-content: space-between;
    align-items: center;
    width: inherit;
    height: inherit;
}

.container-logo {
    display: grid;
    place-items: center;
    height: inherit;
    width: 90px;
}

.container-logo a img {
    width: 70px;
    height: 70px;
}

.container-buttons {
    display: flex;
    justify-content: end;
    position: relative;
    height: inherit;
    width: 55%;
    margin-right: 1.5%;
}

.list-buttons {
    display: flex;
    width: 65%;
    align-items: center;
    justify-content: space-evenly;
    height: inherit;
    list-style: none;
    font-size: 1.8rem;
}

.list-buttons li a {
    color: var(--primary-color);
    text-decoration: none;
}

li i {
    color: var(--primary-color);
    font-size: 2.4rem;
    cursor: pointer;
}

.title-app {
    font-size: 3.6rem;
    position: absolute;
    bottom: calc(50% - 25px);
    left: -250px;
}

.menu-mobile {
    display: none;
    justify-content: space-between;
    width: inherit;
    height: inherit;
}

.menu-mobile__item {
    display: grid;
    place-items: center;
    width: 96px;
    height: inherit;
}

.menu-mobile__item i {
    color: var(--primary-color);
    font-size: 35px;
}

.container-logo img {
    width: 76px;
    height: 76px;
}

.nav-menu {
    position: fixed;
    top: 0;
    left: 0;
    width: 30vw;
    height: 100%;
    background: var(--background-color-two);
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    box-shadow: 0 0 6px rgba(0, 0, 0, 0.5);
    transition: transform .5s ease-in-out;
    transform: translate(-100%);
}

.nav-menu__active {
    transform: translate(0);
}

.nav-menu a {
    font-size: 2rem;
    color: var(--primary-color);
    text-decoration: none;
    cursor: pointer;

}

.user-information {
    display: flex;
    justify-content: center;
    place-items: center;
    flex-direction: column;
    width: inherit;
    height: 40%;
}

.user-name-nav-mobile {
    font-size: 1.6rem;
}

.logout-button {
    display: flex;
    align-items: center;
    height: 40px;
    margin-top: 30px;
    padding: 25px 48px;
    border-radius: 12px;
    border: none;
    color: var(--background-color);
    background-color: var(--primary-color);
}
main {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 50px;
    width: 100%;
}

.title-section {
    margin-top: 40px;
    font-size: 2.4rem;
    font-weight: 500;

}

.section {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 50px;
    width: 100%;
    max-width: 1200px;
    height: 800px;
}
footer {
    display: flex;
    justify-content: center;
    width: 100%;
    height: 400px;
    margin-top: 50px;
    background-color: var(--background-color-two);
}

.footer-desktop {
    width: 100%;
    max-width: 900px;
    height: inherit;
    display: flex;
}

.footer-item__desktop {

    display: flex;
    justify-content: center;
    place-items: center;
    justify-content: center;
    height: inherit;
    width: 100%;
    max-width: 450px;
}

.footer-item__desktop p {
    font-size: 1.4rem;
}

.two {
    display: flex;
    flex-direction: column;
}

.two p {
    font-size: 2.4rem;
    text-align: center;
    margin-bottom: 20px;
}

.icons-footer-content {
    width: 100%;
    height: 40px;
    display: flex;
    gap: 40px;
    justify-content: center;
    align-items: center;
}

.icons-footer-content i {
    font-size: 3rem;
    color: var(--primary-color);
}

.text__contact {
    margin-top: 20px;
    font-size: 1.6rem;
}

.texto-footer-mobile {
    text-align: center;
    padding: 40px;
    font-weight: bold;
    font-size: 1.8rem;
}

.location {
    width: 280px;
    height: 280px;
    border-radius: 50%;
}

.footer-mobile {
    display: none;
}

::-webkit-scrollbar {
    display: none;
}

@media (min-width: 1024px) {
    .menu-desktop {
        display: flex;
    }

    /* Estilos del formulario para pantallas grandes (desktop) */
    form {
        max-width: 700px; /* Puedes ajustar este valor si lo consideras necesario */
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

    /* Estilos del formulario para pantallas pequeñas (mobile) */
    form {
        padding: 15px; /* Reduzco el padding para aprovechar más el espacio en pantallas pequeñas */
    }

    label, input[type="text"], input[type="date"], input[type="email"], input[type="password"], input[type="tel"], select {
        font-size: 1.2rem; /* Reduzco un poco el tamaño de la fuente para mejor visualización */
    }

    button[type="submit"] {
        font-size: 1.4rem; /* Ajusto el tamaño del botón para pantallas pequeñas */
    }
}

</style>
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
        <h1 class="title-app">¡Bienvenido al Gran Bazar!</h1>
        <ul class="list-buttons">
            <li>
                <a href="index.php">Home</a>
            </li>
            <li>
                <a href="mujeres.php">Mujer</a>
            </li>
            <li>
                <a href="ninas.php">Niña</a>
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
</div>

<div class="nav-menu">
    <a href="index.php">Home</a>
            <a href="mujeres.php">Mujeres</a>
            <a href="ninas.php">Niñas</a>
            <a href="login.php">Iniciar sesión</a>
</div>
</header>

<h2>Registre sus datos en el siguiente apartado:</h2>
<form action="" method="post">
    <!-- Datos para tb_ubicaciones -->
    <label for="direccion">Dirección:</label>
    <input type="text" name="direccion" required>
    
    <label for="ciudad">Ciudad:</label>
    <input type="text" name="ciudad" required>
    
    <label for="estado">Estado:</label>
    <input type="text" name="estado" required>

    <!-- Datos para tb_personas -->
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" required>
    
    <label for="primer_apellido">Primer Apellido:</label>
    <input type="text" name="primer_apellido" required>
    
    <label for="segundo_apellido">Segundo Apellido:</label>
    <input type="text" name="segundo_apellido" >
    
    <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
    <input type="date" name="fecha_nacimiento" required>
    
    <label for="genero">Género:</label>
    <select name="genero">
        <option value="M">Masculino</option>
        <option value="F">Femenino</option>
        <option value="N/B">No Binario</option>
    </select>

    <!-- Datos para tb_usuarios -->
    <label for="nombre_usuario">Nombre de Usuario:</label>
    <input type="text" name="nombre_usuario" required>
    
    <label for="email">Email:</label>
    <input type="email" name="email" required>
    
    <label for="contraseña">Contraseña:</label>
    <input type="password" name="contraseña" required>
    
    <label for="numero_telefonico">Número Telefónico:</label>
    <input type="tel" name="numero_telefonico" required>
    
    <button type="submit">Registrar</button>
</form>
<footer>
        <section class="footer-desktop">
            <div class="footer-item__desktop">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4011.1913055687737!2d-97.9584259705053!3d20.238582122701505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2smx!4v1691865537809!5m2!1sen!2smx" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="location"></iframe>
            </div>
            <div class="footer-item__desktop two">
                <p>Encuentranos en nuestras redes sociales</p>
                <div class="icons-footer-content">
                    <i class='bx bxl-facebook-square'></i> <br>
                    <i class='bx bxl-instagram-alt' ></i> <br>
                    <i class='bx bxl-tiktok' ></i>
                </div>
            </div>    
        </section>  

        <section class="footer-mobile">
            <div class="footer-item__desktop two">
                <p>Encuentranos en nuestras redes sociales</p>
                <div class="icons-footer-content">
                    <i class='bx bxl-facebook-square'></i> <br>
                    <i class='bx bxl-instagram-alt' ></i> <br>
                    <i class='bx bxl-tiktok' ></i>
                </div>
            </div>
            <p class="texto-footer-mobile">Visitanos</p> 
            <div class="footer-item__desktop">
                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d4011.1913055687737!2d-97.9584259705053!3d20.238582122701505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1sen!2smx!4v1691865537809!5m2!1sen!2smx" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="location"></iframe>
            </div>
        </section>
    </footer>
    <script src="nav-bar.js"></script>

<?php
if($message != ''){
    echo "<p>$message</p>";
}
?>

</body>
</html>
