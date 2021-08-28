<?php
//Mahesalingam Kayuran - ESIG
//Page de présentation d'hotel
$idHOT   = (isset($_GET["id"]))         ? $_GET["id"]                        :0;
$title    = (isset($_GET["nom"]))      ? html_entity_decode($_GET["nom"]) :$idHOT;

include('header.php');

$hotel  = getOnehotel($idHOT);

?>

<table class="jacket table-bordered">
  <tr class="gradeA">
    <td rowspan="4">
        <img src="<?= $hotel["images"] ?>" class="hotel">
      </a>
    </td>
    <td>
      <h1 class="info">
          <?= $hotel["nom"] ?>

        </a>
      </h1>
    </td>
  </tr>
  <tr class="gradeA">
    <td class="info">
      Note : <?= $hotel["rating"] ?><br><br>
      
    </td>
  </tr>


  <tr class="gradeA">
    <td class="info">
      <br><?= $hotel["description"] ?><br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">Retour à l'accueil</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>

</table>


<?php include('footer.php'); ?>
