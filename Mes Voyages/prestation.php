<?php


$idPRE   = (isset($_GET["id"]))         ? $_GET["id"]                        :0;
$nom    = (isset($_GET["nom"]))      ? html_entity_decode($_GET["nom"]) :$idPRE;
include('header.php');

$pays  = getOnePays($idPRE);



$idUser   = (isset($_SESSION["idUser"]))?$_SESSION["idUser"]:0;
if ($idUser > 0) {

  if (isset($_GET["ranking"])) { // Ranking change!
    $ranking = $_GET["ranking"];
    switch($ranking) {
      case -1: // Disliked
      case 0:  // No opinion
      case 1:  // Loved!
      case 99: // Unseen pays
      setFeedback($idUser, $idPRE, $ranking);
      $feedback = $ranking; // New ranking applied
      break;
      default: // Invalid value => Get current value
      $feedback = getFeedback($idUser, $idPRE);
      break;
    }
  } else {  // Ranking unchanged => Get current value
    $feedback = getFeedback($idUser, $idPRE);
  }
} else { // Not connected
  $feedback = 99;
}

?>

<table class="jacket table-bordered">
  <tr class="gradeA">
    <td rowspan="4">
        <img src="<?= $pays["images"] ?>" class="prestation">
      </a>
    </td>
    <td>
      <h1 class="info">
          <?= $pays["nom"] ?>

        </a>
      </h1>
    </td>
  </tr>
  <tr class="gradeA">
    <td class="info">
      Numéro : <?= $pays["idPRE"] ?><br><br>
      
    </td>
  </tr>

  <?php if ($idUser > 0): ?>

    <tr class="gradeA ranking">
      <td>
        <table>
          <tr>

            <td valign="middle" class="icons">
              <?php if ($feedback != -1): ?>
                <a href="prestation.php?id=<?= $pays['idPRE'] ?>&ranking=-1&nom=<?= $_GET['nom'] ?>">
                  <img class="icons" src="ressources/sad-face-outline-unselected.png">
                </a><br>
                <small class="unselected">Disliked</small>
              <?php else : ?>
                <a href="prestation.php?id=<?= $pays['idPRE'] ?>&ranking=99&nom=<?= $_GET['nom'] ?>">
                  <img class="icons" src="ressources/sad-face-outline-selected.png">
                </a><br>
                <small class="selected">Disliked</small>
              <?php endif; ?>
            </td>

            <td valign="middle" class="icons">
              <?php if ($feedback != 0): ?>
                <a href="prestation.php?id=<?= $pays['idPRE'] ?>&ranking=0&nom=<?= $_GET['nom'] ?>">
                  <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-unselected.png">
                </a><br>
                <small class="unselected">No opinion</small>
              <?php else : ?>
                <a href="prestation.php?id=<?= $pays['idPRE'] ?>&ranking=99&nom=<?= $_GET['nom'] ?>">
                  <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-selected.png">
                </a><br>
                <small class="selected">No opinion</small>
              <?php endif; ?>
            </td>

            <td valign="middle" class="icons">
              <?php if ($feedback != 1): ?>
                <a href="prestation.php?id=<?= $pays['idPRE'] ?>&ranking=1&nom=<?= $_GET['nom'] ?>">
                  <img class="icons" src="ressources/smiling-emoticon-face-unselected.png">
                </a><br>
                <small class="unselected">Loved!</small>
              <?php else : ?>
                <a href="prestation.php?id=<?= $pays['idPRE'] ?>&ranking=99&nom=<?= $_GET['nom'] ?>">
                  <img class="icons" src="ressources/smiling-emoticon-face-selected.png">
                </a><br>
                <small class="selected">Loved!</small>
              <?php endif; ?>
            </td>

          </tr>
        </table>
      </td>
    </tr>

  <?php else: ?>

    <tr class="gradeA ranking">
      <td>
        <table>
          <tr>

            <td valign="middle" class="icons">
              <a href="login.php">
                <img class="icons" src="ressources/sad-face-outline-unselected.png">
              </a><br>
              <small class="unselected">Disliked</small>
            </td>
            <td valign="middle" class="icons">
              <a href="login.php">
                <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-unselected.png">
              </a><br>
              <small class="unselected">No opinion</small>
            </td>
            <td valign="middle" class="icons">
              <a href="login.php">
                <img class="icons" src="ressources/smiling-emoticon-face-unselected.png">
              </a><br>
              <small class="unselected">Loved!</small>
            </td>

          </tr>
        </table>
      </td>
    </tr>

  <?php endif; ?>

  <tr class="gradeA">
    <td class="info">
      <br><?= $pays["description"] ?><br>
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">Retour à l'accueil</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>

</table>

<?php foreach (getHotelPRE($idPRE) as $hotel): ?>

<div class='cartouche'>
  <div class='card'>
    <div class='data'>
      <?= $hotel[$_SESSION["order"]] . (($_SESSION["order"] == "rating")?"note :":"") ?>
    </div>
    <div class='pict'>
      <a href="hotel.php?id=<?= $hotel['idHOT'] ?>&nom=<?= htmlentities($hotel['nom']) ?>"><img src="<?= $hotel['images'] ?>" alt="<?= $hotel['nom'] ?>"></a>
    </div>
  </div>
</div>
<?php endforeach; ?>

<?php include('footer.php'); ?>
