<!--
* * * * * * * * * * * * * * * * * *
* v.3 - 2019 - Rodrigues William - ESIG
* v.2 - 2019 - Blanvillain Christian - ESIG
* v.1 - 2017 - Henauer Fabien - CFPT
* * * * * * * * * * * * * * * * * *
-->

<?php
$title = "Movies Database";
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
if (isset($_POST["orderByTitle"])) {
  $_SESSION["order"] = "title";
}
// by year
if (isset($_POST["orderByYear"])) {
  $_SESSION["order"] = "year";
}
// by duration
if (isset($_POST["orderByDuration"])) {
  $_SESSION["order"] = "duration";
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
  <button class="btn btn-default" type="submit" name="orderByRating">Order by Rating</button>
  <button class="btn btn-default" type="submit" name="orderByTitle">Order by Title</button>
  <button class="btn btn-default" type="submit" name="orderByYear">Order by Year</button>
  <button class="btn btn-default" type="submit" name="orderByDuration">Order by Duration</button>
  <button class="btn btn-default" type="submit" name="directionSwap">Toggle Order swap</button>
  <?php if (isset($_SESSION["idUser"]) && $_SESSION["idUser"] > 0): ?>
  <button class="btn btn-default" type="submit" name="filterSwap">Toggle Filter</button>
  <?php endif; ?>
</form>
<br/>

<?php foreach (getMovies($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], @$_SESSION["idUser"], "verbose") as $movie): ?>

  <div class='cartouche'>
    <div class='card'>
      <div class='data'>
        <?= $movie[$_SESSION["order"]] . (($_SESSION["order"] == "duration")?" mn":"") ?>
      </div>
      <div class='pict'>
        <a href="movie.php?id=<?= $movie['idIMDB'] ?>&title=<?= htmlentities($movie['title']) ?>"><img src="<?= $movie['picture'] ?>" alt="<?= $movie['title'] ?>"></a>
      </div>
    </div>
  </div>

<?php endforeach; ?>
<?php include('footer.php'); ?>
