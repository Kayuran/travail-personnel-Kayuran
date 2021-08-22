
<?php include('header.php');
$idUser   = (isset($_SESSION["idUSER"])) ? $_SESSION(["idUSER"])              :0;
?>
 

<?php if ($idUser = 0): ?>

  <h2><a href="login.php">Veuillez vous connectez svp</a></h2>




<?php else: ?>

<form AjouterDestination="AjouterDestination.php" method="post">
 <br>
 <p>Ajouter un Pays : <input type="text" name="Pays" /></p>
 <p>Chemin de l'image Pays (ex : ./images/Canaries.jpg) : <input type="text" name="ImagePays"size="30" /></p>
 <p>Description du Pays : <input type="textbox" name="DescrPays"size="100" /></p>
 <br>
 <br>
 <p>Ajouter un Hotel : <input type="text" name="Hotel" /></p>
 <p>Chemin de l'image Hotel (ex : ./images/hotels/Canaries/Riu Calypso.jpg) : <input type="text" name="ImagePays" size="30"/></p>
 <p>Description de l'Hotel : <input type="text" name="DescrHotel"size="100" /></p>
 <br>
 <p><input type="submit" value="Enregistrer"></p>
</form>


<?php endif; ?>

<?php
$nom =
try {

		
		if(@$_POST['Enregistrer']) {

      myConnection()=



