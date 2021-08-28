
<?php 
include('header.php');
//Page de formulaire d'ajout de prestation et d'hotel
//Mahesalingam Kayuran - ESIG
?>
 

<form AjouterDestination="AjouterDestination.php" method="post">
 <br>
 <p>Ajouter un Pays : <input class="form-control" type="text" name="Pays"required /></p>
 <p>Chemin de l'image Pays (ex : ./images/Canaries.jpg) : <input class="form-control" type="text" name="ImagePays" required/></p>
 <p>Description du Pays : <input class="form-control" type="text" name="DescrPays" required /></p>
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

 <p>Ajouter un Hotel : <input class="form-control" type="text" name="Hotel" required/></p>
 <p>Chemin de l'image Hotel (ex : ./images/hotels/Canaries/Riu Calypso.jpg) : <input class="form-control" type="text" name="ImageHotel" required /></p>
 <p>Description de l'Hotel : <input class="form-control" type="text" name="DescrHotel" required /></p>
 <p>Note de l'Hotel : <input class="form-control" type="text" name="Rating" required /></p>
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

       // END
       myConnection();
     
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

      // END
      myConnection();


    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
      die();
    } 
}


?>

<tr class="gradeA">
    <td class="info">
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">Retour à l'accueil</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>



