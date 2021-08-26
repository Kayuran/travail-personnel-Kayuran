<?php
  $title = "Login";
  include('header.php');

  // login.php
  if (isset($_POST["btnLogin"])) {

    $email = $_POST["email"];
    $pswrd = $_POST["password"];

    //inscription

    if (!empty($_POST["register"])) { 

      try {
        $user = getOneUser($email); 
        if (empty($user)) { 
            createUser($email, sha1($pswrd));
            $user = getOneUser($email); 
            $_SESSION["message"] = "Vous n'êtes pas " . $email . "?";
            $_SESSION["idUser"]  = $user["idUser"];  
            header("Location:index.php");
        } else { 
          if ($user["password"] == sha1($pswrd)) { 
            $_SESSION["message"] = "Not " . $email . "?";
            $_SESSION["idUser"]  = $user["idUser"];
            header("Location:index.php"); 
          } else { // Please login message
            $_SESSION["message"] = "Compte déjà existant! Veuillez vous connecter...";
            $_SESSION["idUser"]  = 0;          
            header("Location:login.php");
          }         
        }
      } catch (Exception $e) { 
            $_SESSION["message"] = "Se connecter ou s'inscrire";
            $_SESSION["idUser"]  = 0; // Pas connecté
            header("Location:error.php?message=".$e->getMessage());
      } 

    } else { 
    
      //Se connecter
      try {
        $user = getOneUser($email); 
        if ($user["password"]   == sha1($pswrd)) { //vérification password
            $_SESSION["message"] = "Not " . $email . "?";
            $_SESSION["idUser"]  = $user["idUser"];
            header("Location:index.php");
        } else { // ID invalide
            $_SESSION["message"] = "ID INVALIDE";
            $_SESSION["idUser"]  = 0;
            header("Location:login.php");
        }
      } catch (Exception $e) { 
            $_SESSION["message"] = "Se connecter ou s'inscrire";
            $_SESSION["idUser"]  = 0; // Pas connecté
            header("Location:error.php?message=".$e->getMessage());
      }
    } 
  }

?>

            <div class="input-group custom-search-form">
                <fieldset>
                  <legend><?= empty($_SESSION["message"])?"Se connecter ou s'inscrire":$_SESSION["message"] ?></legend>
                  <form method="post" action="login.php">
                    eMail<input class="form-control" type="email" name="email" required><br>
                    Mot de passe<input class="form-control" type="password" name="password" required><br>
                    &nbsp;<br>
                    <button class="btn btn-default" type="submit" name="btnLogin">Login</button><br>
                    <br>
                    <label><input type="checkbox" name="register" value="1">&nbsp;&nbsp;Créer un nouveau compte</label>
                  </form>
                </fieldset>
            </div>


<?php include('footer.php'); ?>
