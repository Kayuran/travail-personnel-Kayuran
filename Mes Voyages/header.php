<?php
  require 'dbfonctions.php';
  session_start();
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link href="bootstrap/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/vendor/metisMenu/metisMenu.css" rel="stylesheet">
    <link href="bootstrap/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <link href="bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title><?= $nom ?></title>
  </head>
  <body>
    <div class="col-lg-12">
      
      <header>
        <table>
          <tr>
              
            <td>
              <h1>MesVoyages</h1>
            </td>
            <td>
              <nav>
                <?php if (isset($_SESSION["idUser"]) && $_SESSION["idUser"] > 0): ?>

                  <a href="logout.php"><?= $_SESSION["message"] ?></a><br>
                <?php else: ?>

                  <a href="login.php"><?= empty($_SESSION["message"])?"Login or register":$_SESSION["message"] ?></a><br>
                <?php endif; ?>
                
              </nav>
            </td>
          </tr>
        </table>
      </header>

