<?php

$idUser   = (isset($_SESSION["idUSER"])) ? $_SESSION(["idUSER"])              :0;
$idPRE   = (isset($_GET["idPRE"]))         ? $_GET["idPRE"]                        :0;
$title    = (isset($_GET["pays"]))      ? html_entity_decode($_GET["pays"]) :$idPRE;
include('header.php');

$pays  = getOnePays($idPRE);
if (empty($pays)) header("Location:index.php");

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
        <img src="<?= $pays["image"] ?>" class="pays">
      </a>
    </td>
    <td>
      <h3 class="info">
          <?= $pays["title"] ?>

        </a>
      </h3>
    </td>
  </tr>
  <tr class="gradeA">
    <td class="info">
      Note : <?= $pays["rating"] ?>/10<br>
      Year : <?= $pays["year"] ?><br>
      Runtime : <?= $pays["duration"] ?> mn<br><br>

      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">Back to list</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>

  <?php if ($idUser > 0): ?>

    <tr class="gradeA ranking">
      <td>
        <table>
          <tr>

            <td valign="middle" class="icons">
              <?php if ($feedback != -1): ?>
                <a href="pays.php?id=<?= $pays['idPRE'] ?>&ranking=-1&title=<?= $_GET['pays'] ?>">
                  <img class="icons" src="ressources/sad-face-outline-unselected.png">
                </a><br>
                <small class="unselected">Disliked</small>
              <?php else : ?>
                <a href="pays.php?id=<?= $pays['idPRE'] ?>&ranking=99&title=<?= $_GET['pays'] ?>">
                  <img class="icons" src="ressources/sad-face-outline-selected.png">
                </a><br>
                <small class="selected">Disliked</small>
              <?php endif; ?>
            </td>

            <td valign="middle" class="icons">
              <?php if ($feedback != 0): ?>
                <a href="pays.php?id=<?= $pays['idPRE'] ?>&ranking=0&title=<?= $_GET['pays'] ?>">
                  <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-unselected.png">
                </a><br>
                <small class="unselected">No opinion</small>
              <?php else : ?>
                <a href="pays.php?id=<?= $pays['idPRE'] ?>&ranking=99&title=<?= $_GET['pays'] ?>">
                  <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-selected.png">
                </a><br>
                <small class="selected">No opinion</small>
              <?php endif; ?>
            </td>

            <td valign="middle" class="icons">
              <?php if ($feedback != 1): ?>
                <a href="pays.php?id=<?= $pays['idPRE'] ?>&ranking=1&title=<?= $_GET['pays'] ?>">
                  <img class="icons" src="ressources/smiling-emoticon-face-unselected.png">
                </a><br>
                <small class="unselected">Loved!</small>
              <?php else : ?>
                <a href="pays.php?id=<?= $pays['idPRE'] ?>&ranking=99&title=<?= $_GET['pays'] ?>">
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
      <br><?= $pays["summary"] ?><br>
    </td>
  </tr>

</table>

<?php include('footer.php'); ?>
