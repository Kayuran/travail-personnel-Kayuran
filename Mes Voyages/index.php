

<?php
$title = "Mes Voyages";
include('header.php');


// Valeurs par defauts
if (!isset($_SESSION["order"])) {
  $_SESSION["order"] = "name"; 
  $_SESSION["direction"] = "ASC"; 
  $_SESSION["filter"] = isset($_SESSION["idUser"]); 
}
// Par note
if (isset($_POST["orderByRating"])) {
  $_SESSION["order"] = "rating";
}

// Par ordre d'ajout
if (isset($_POST["orderByOrder"])) {
  $_SESSION["order"] = "idPRE";
}


// Par nom
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
  
  <button class="btn btn-default" type="submit" name="orderByName">Accéder aux pays</button>
  <button class="btn btn-default" type="submit" name="directionSwap">Toggle Order swap</button>
  <button class="btn btn-default" type="submit" name="orderByOrder">Trier par ordre d'ajout</button>
  <?php if (isset($_SESSION["idUser"]) && $_SESSION["idUser"] > 0): ?>
  <button class="btn btn-default" type="submit" name="filterSwap">Toggle Filter</button>
  <?php endif; ?>
</form>
<br/>

<?php foreach (getPays($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], @$_SESSION["idUser"], "verbose") as $pays): ?>

  <div class='cartouche'>
    <div class='card'>
    <div class='data'>
        <?=$pays[$_SESSION["order"]] . (($_SESSION["order"] == "nom")?"":"") ?>
      </div>
      <div class='pict'>
        <a href="movie.php?id=<?= $pays['idPRE'] ?>&nom=<?= htmlentities($pays['nom']) ?>"><img src="<?= $pays['image'] ?>" alt="<?= $pays['nom'] ?>"></a>
      </div>
    </div>
  </div>

<?php endforeach; ?>
<?php include('footer.php'); ?>
