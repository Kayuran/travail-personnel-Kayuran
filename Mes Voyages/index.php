

<?php
$title = "Mes Voyages";
include('header.php');

// toggle button initialisation and default order set
if (!isset($_SESSION["order"])) {
  $_SESSION["order"] = "rating"; // Default value: best unseen movies first
  $_SESSION["direction"] = "DESC"; // Default value: descending order
  $_SESSION["filter"] = isset($_SESSION["idUser"]); // Filter if connected, all movies else.
}
// by note
if (isset($_POST["orderByRating"])) {
  $_SESSION["order"] = "rating";
}
// by title
if (isset($_POST["orderByName"])) {
  $_SESSION["order"] = "nom";
}


// order swap
if (isset($_POST["directionSwap"])) {
  if ($_SESSION["direction"] == "ASC") {
    $_SESSION["direction"] = "DESC";
  } else {
    $_SESSION["direction"] = "ASC";
  }
}

// filter swap
if (isset($_POST["filterSwap"])) {
  if ($_SESSION["filter"] == false) {
    $_SESSION["filter"] = true;
  } else {
    $_SESSION["filter"] = false;
  }
}

?>


<form method="post" action="index.php" enctype="multipart/form-data" id="ordering">
  <button class="btn btn-default" type="submit" name="orderByRating">Trier par note</button>
  <button class="btn btn-default" type="submit" name="orderByName">Trier par nom </button>
  <button class="btn btn-default" type="submit" name="directionSwap">Toggle Order swap</button>
  <?php if (isset($_SESSION["idUser"]) && $_SESSION["idUser"] > 0): ?>
  <button class="btn btn-default" type="submit" name="filterSwap">Toggle Filter</button>
  <?php endif; ?>
</form>
<br/>

<?php foreach (getPays($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], @$_SESSION["idUser"], "verbose") as $pays): ?>

  <div class='cartouche'>
    <div class='card'>
      <div class='pict'>
        <a href="movie.php?id=<?= $pays['idPRE'] ?>&title=<?= htmlentities($pays['pays']) ?>"><img src="<?= $pays['image'] ?>" alt="<?= $pays['pays'] ?>"></a>
      </div>
    </div>
  </div>

<?php endforeach; ?>
<?php include('footer.php'); ?>
