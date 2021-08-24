
<?php 
include('header.php');
?>
 




<form AjouterDestination="AjouterDestination.php" method="post">
 <br>
 <p>Ajouter un Pays : <input class="form-control" type="text" name="Pays" /></p>
 <p>Chemin de l'image Pays (ex : ./images/Canaries.jpg) : <input class="form-control" type="text" name="ImagePays" /></p>
 <p>Description du Pays : <input class="form-control" type="text" name="DescrPays" /></p>
 <p><button class="btn btn-default" type="submit" name="AjouterPays">Ajouter un Pays</button><br>
 <br>
 <br>
 </form>
 <form AjouterHotel="AjouterDestination.php" method="post">
 <label for="paysSelect">Selectionner un pays :</label>
 <select name="paysSelect" >
 <?php foreach (getPays($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], @$_SESSION["idUser"], "verbose") as $paysHotel): ?>
  <option value = "<?= $paysHotel['idPRE']; ?>"><?= $paysHotel['nom']; ?></option>
 <?php endforeach; ?>
 </select>

 <p>Ajouter un Hotel : <input class="form-control" type="text" name="Hotel" /></p>
 <p>Chemin de l'image Hotel (ex : ./images/hotels/Canaries/Riu Calypso.jpg) : <input class="form-control" type="text" name="ImageHotel" /></p>
 <p>Description de l'Hotel : <input class="form-control" type="text" name="DescrHotel" /></p>
 <p>Note de l'Hotel : <input class="form-control" type="text" name="Rating" /></p>
 <p><button class="btn btn-default" type="submit" name="AjouterHotel">Ajouter un Hotel</button><br>
 <br>
</form>


<?php

		
if (isset($_POST["AjouterPays"])) {

      $pays = $_POST["Pays"];
      $images = $_POST["ImagePays"];
      $description = $_POST["DescrPays"];

      try {
       createPays($pays,$images,$description);
       

    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
    } 
}

?>
 
<?php

		
if (isset($_POST["AjouterHotel"])) {

      $idpays = $_POST["paysSelect"];;
      $imagesHotel = $_POST["ImageHotel"];
      $descriptionHotel = $_POST["DescrHotel"];
      $rating = $_POST["Rating"];
      $hotel = $_POST["Hotel"];

    try {
      createHotel($idpays,$hotel,$rating,$imagesHotel,$descriptionHotel);

    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
    } 
}

?>



