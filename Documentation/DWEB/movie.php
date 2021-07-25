<?php

$idUser   = (isset($_SESSION["idUser"])) ? $_SESSION(["idUser"])              :0;
$idIMDB   = (isset($_GET["id"]))         ? $_GET["id"]                        :0;
$title    = (isset($_GET["title"]))      ? html_entity_decode($_GET["title"]) :$idIMDB;
include('header.php');

$movie    = getOneMovie($idIMDB);
if (empty($movie)) header("Location:index.php");
$next     = getNextMovie($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], $idUser, $idIMDB);
$previous = getPrevMovie($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], $idUser, $idIMDB);

if ($idUser > 0) {

  if (isset($_GET["ranking"])) { // Ranking change!
    $ranking = $_GET["ranking"];
    switch($ranking) {
      case -1: // Disliked
      case 0:  // No opinion
      case 1:  // Loved!
      case 99: // Unseen movie
      setFeedback($idUser, $idIMDB, $ranking);
      $feedback = $ranking; // New ranking applied
      break;
      default: // Invalid value => Get current value
      $feedback = getFeedback($idUser, $idIMDB);
      break;
    }
  } else {  // Ranking unchanged => Get current value
    $feedback = getFeedback($idUser, $idIMDB);
  }
} else { // Not connected
  $feedback = 99;
}

?>

<table class="jacket table-bordered">
  <tr class="gradeA">
    <td rowspan="4">
      <a href="http://www.imdb.com/title/<?= $movie["idIMDB"] ?>" target="_blank">
        <img src="<?= $movie["picture"] ?>" class="movie">
      </a>
    </td>
    <td>
      <h3 class="info">
        <a href="http://www.imdb.com/title/<?= $movie["idIMDB"] ?>" target="_blank">
          <?= $movie["title"] ?>

        </a>
      </h3>
    </td>
  </tr>
  <tr class="gradeA">
    <td class="info">
      Note : <?= $movie["rating"] ?>/10<br>
      Year : <?= $movie["year"] ?><br>
      Runtime : <?= $movie["duration"] ?> mn<br><br>
      <br>

      <?php if (!empty($previous['idIMDB'])): ?>
        <a href="movie.php?id=<?= $previous['idIMDB'] ?>&title=<?= htmlentities($previous['title']) ?>">&lt;&lt;&lt;</a>
      <?php endif; ?>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">Back to list</a>&nbsp;&nbsp;&nbsp;&nbsp;
      <?php if (!empty($next['idIMDB'])): ?>
        <a href="movie.php?id=<?= $next['idIMDB'] ?>&title=<?= htmlentities($next['title']) ?>">&gt;&gt;&gt;</a>
      <?php endif; ?>

    </td>
  </tr>

  <?php if ($idUser > 0): ?>

    <tr class="gradeA ranking">
      <td>
        <table>
          <tr>

            <td valign="middle" class="icons">
              <?php if ($feedback != -1): ?>
                <a href="movie.php?id=<?= $movie['idIMDB'] ?>&ranking=-1&title=<?= $_GET['title'] ?>">
                  <img class="icons" src="ressources/sad-face-outline-unselected.png">
                </a><br>
                <small class="unselected">Disliked</small>
              <?php else : ?>
                <a href="movie.php?id=<?= $movie['idIMDB'] ?>&ranking=99&title=<?= $_GET['title'] ?>">
                  <img class="icons" src="ressources/sad-face-outline-selected.png">
                </a><br>
                <small class="selected">Disliked</small>
              <?php endif; ?>
            </td>

            <td valign="middle" class="icons">
              <?php if ($feedback != 0): ?>
                <a href="movie.php?id=<?= $movie['idIMDB'] ?>&ranking=0&title=<?= $_GET['title'] ?>">
                  <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-unselected.png">
                </a><br>
                <small class="unselected">No opinion</small>
              <?php else : ?>
                <a href="movie.php?id=<?= $movie['idIMDB'] ?>&ranking=99&title=<?= $_GET['title'] ?>">
                  <img class="icons" src="ressources/silent-emoticon-face-with-missed-mouth-symbol-of-stroke-selected.png">
                </a><br>
                <small class="selected">No opinion</small>
              <?php endif; ?>
            </td>

            <td valign="middle" class="icons">
              <?php if ($feedback != 1): ?>
                <a href="movie.php?id=<?= $movie['idIMDB'] ?>&ranking=1&title=<?= $_GET['title'] ?>">
                  <img class="icons" src="ressources/smiling-emoticon-face-unselected.png">
                </a><br>
                <small class="unselected">Loved!</small>
              <?php else : ?>
                <a href="movie.php?id=<?= $movie['idIMDB'] ?>&ranking=99&title=<?= $_GET['title'] ?>">
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
      <br><?= $movie["summary"] ?><br>
    </td>
  </tr>

</table>

<?php include('footer.php'); ?>
