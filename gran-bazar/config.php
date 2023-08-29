<?php
// config.php

// Cargar la configuración de la base de datos
$config = require 'db_config.php';

// Crear la cadena DSN para PDO
$dsn = "mysql:host={$config['host']};dbname={$config['db']};charset={$config['charset']}";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,     // Activar los errores en modo excepción
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,           // Establecer el modo de recuperación por defecto en FETCH_ASSOC
    PDO::ATTR_EMULATE_PREPARES   => false,                      // Desactivar la emulación de sentencias preparadas
];

try {
    // Intentar establecer una conexión a la base de datos
    $pdo = new PDO($dsn, $config['user'], $config['pass'], $options);
} catch (\PDOException $e) {
    // En caso de error, mostrar un mensaje genérico al usuario
    die("Error al conectar a la base de datos: " . $e->getMessage());
}
