<?php
session_start();
ob_start();  



if (isset($_SESSION['user_id'])) {
    unset($_SESSION['user_id']);  
    session_destroy();  
    var_dump($_SESSION);
}

ob_end_flush();  


header("Location: index.php");
exit();
?>
