<?php
  $title = "Oups!";
  include('header.php');
?>

            <div class="input-group custom-search-form">
                <h2>Sorry...</h2>
                <p><?= $_GET['message']; ?></p>
            </div>
            <div class="input-group custom-search-form">
              <br>
              <a href="index.php">Retour à l'accueil.</a>
            </div>


<?php include('footer.php'); ?>
