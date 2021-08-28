<?php
//Page de suppression et de modification de données des tables hotel et prestation
//Mahesalingam Kayuran - ESIG

include('header.php');

?>


<form SupprimerPays="Supprimer.php" method="post">
 <br>

 <label for="paysSelect">Selectionner un pays :</label>
 <select name="paysSelect" >
 <?php foreach (getPays($_SESSION["order"], $_SESSION["direction"], $_SESSION["filter"], @$_SESSION["idUser"], "verbose") as $pays): ?>
  <option value = "<?= $pays['idPRE']; ?>"><?= $pays['nom']; ?></option>
 <?php endforeach; ?>
 </select>  

<p><button class="btn btn-default" type="submit" name="suppPays">Supprimer le pays selectionné</button><br></form>

<form SupprimerPays="Supprimer.php" method="post">
 <p>Modifier le nom du Pays selectionné : <input class="form-control" type="text" name="Pays" required /></p>
 <p>Modifier chemin de l'image du Pays selectionné : (ex : ./images/Canaries.jpg) <input class="form-control" type="text" name="ImagePays" required /></p>
 <p>Modifier description du Pays selectionné: <input class="form-control" type="text" name="DescrPays" required /></p>

 <p><button class="btn btn-default" type="submit" name="modifPays">Modifier le Pays</button><br>
 <br>
 <br>
</form>



 <form SupprimerHotel="Supprimer.php" method="post">

 <label for="hotelSelect">Selectionner un hotel :</label>
 <select name="hotelSelect" >
 <?php foreach (getAllHotel() as $hotel): ?>
  <option value = "<?= $hotel['idHOT']; ?>"><?= $hotel['nom']; ?></option>
 <?php endforeach; ?>
 </select>  <p>
   
 <button class="btn btn-default" type="submit" name="suppHotel">Supprimer l'hotel selectionné</button><br></form>

 <form SupprimerHotel="Supprimer.php" method="post">
 <p>Modifier le nom de l'hotel selectionné : <input class="form-control" type="text" name="Hotel" required /></p>
 <p>Modifier chemin de l'image de l'hotel selectionné (ex : ./images/hotels/Canaries/Riu Calypso.jpg) : <input class="form-control" type="text" name="ImageHotel" required /></p>
 <p>Modifier description de l'Hotel selectionné : <input class="form-control" type="text" name="DescrHotel" required /></p>
 <p>Modifier note de l'Hotel selectionné : <input class="form-control" type="text" name="Rating" required /></p>

 <p><button class="btn btn-default" type="submit" name="modifHotel">Modifier l'Hotel</button><br>
 <br>
</form>



<?php

		//Modifie les informations du pays selectionné
if (isset($_POST["modifPays"])) {

      $pays = $_POST["Pays"];
      $images = $_POST["ImagePays"];
      $description = $_POST["DescrPays"];
      $idPRE = $_POST["paysSelect"];

      try {
       updatePays($pays,$images,$description, $idPRE);
       
       // END
       myConnection();

    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
    } 
}

?>

<?php

		//Modifie les informations de l'hotel selectionné
if (isset($_POST["modifHotel"])) {

      $hotel = $_POST["Hotel"];
      $imagesHotel = $_POST["ImageHotel"];
      $descriptionHotel = $_POST["DescrHotel"];
      $rating = $_POST["Rating"];
      $idHOT = $_POST["hotelSelect"];

      try {
        updateHotel($idHOT,$hotel,$rating,$imagesHotel, $descriptionHotel);
       
        // END
       myConnection();

    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
    } 
}

?>


<?php

	//Supprime le pays selectionné
if (isset($_POST["suppPays"])) {

      $idPays = $_POST["paysSelect"];
    

      try {
       deletePays($idPays);
       deleteHotelPays($idPays);
       
       // END
       myConnection();

    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
    } 
}

?>
 
<?php

		//Supprime l'hotel selectionné
if (isset($_POST["suppHotel"])) {

      $idHotel = $_POST["hotelSelect"];;
     

    try {
      deleteHotel($idHotel);

      // END
      myConnection();

    } catch (Exception $e) { 
      header("Location:error.php?message=".$e->getMessage());
    } 
}



?>

<tr class="gradeA">
    <td class="info">
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php">Retour à l'accueil</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>



