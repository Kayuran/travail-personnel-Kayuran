
<?php 
include('header.php');
?>
 




<form AjouterDestination="AjouterDestination.php" method="post">
 <br>
 <p>Ajouter un Pays : <input class="form-control" type="text" name="Pays" /></p>
 <p>Chemin de l'image Pays (ex : ./images/Canaries.jpg) : <input class="form-control" type="text" name="ImagePays" /></p>
 <p>Description du Pays : <input class="form-control" type="text" name="DescrPays"size="100" /></p>
 <br>
 <br>
 <p>Ajouter un Hotel : <input type="text" name="Hotel" /></p>
 <p>Chemin de l'image Hotel (ex : ./images/hotels/Canaries/Riu Calypso.jpg) : <input type="text" name="ImageHotel" size="30"/></p>
 <p>Description de l'Hotel : <input type="text" name="DescrHotel"size="100" /></p>
 <br>
 <p><button class="btn btn-default" type="submit" name="Enregistrer">Enregistrer</button><br>
</form>


<?php

		
if (isset($_POST["Enregistrer"])) {

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



