<?php
  $title = "Login";
  include('header.php');

  // login.php
  if (isset($_POST["btnLogin"])) {

    $email = $_POST["email"];
    $pswrd = $_POST["password"];

    if (!empty($_POST["register"])) { // Wanna register!

      try {
        $user = getOneUser($email); // Does it exist already?
        if (empty($user)) { // Doesn't exist => register user and login
            createUser($email, sha1($pswrd));
            $user = getOneUser($email); // Recover existing user
            $_SESSION["message"] = "Not " . $email . "?";
            $_SESSION["idUser"]  = $user["idUser"];  
            header("Location:index.php");
        } else { // User exist already
          if ($user["password"] == sha1($pswrd)) { // With same password?
            $_SESSION["message"] = "Not " . $email . "?";
            $_SESSION["idUser"]  = $user["idUser"];
            header("Location:index.php"); // Then login
          } else { // Please login message
            $_SESSION["message"] = "Already registered! Please login...";
            $_SESSION["idUser"]  = 0;          
            header("Location:login.php");
          }         
        }
      } catch (Exception $e) { // Unknow exception
            $_SESSION["message"] = "Login or register";
            $_SESSION["idUser"]  = 0; // Not connected
            header("Location:error.php?message=".$e->getMessage());
      } 

    } else { // Wanna login!

      try {
        $user = getOneUser($email); // Recover existing user
        if ($user["password"]   == sha1($pswrd)) { // With same password?
            $_SESSION["message"] = "Not " . $email . "?";
            $_SESSION["idUser"]  = $user["idUser"];
            header("Location:index.php");
        } else { // Invalid login or password
            $_SESSION["message"] = "Invalid login or password!";
            $_SESSION["idUser"]  = 0;
            header("Location:login.php");
        }
      } catch (Exception $e) { // Unknow exception
            $_SESSION["message"] = "Login or register";
            $_SESSION["idUser"]  = 0; // Not connected
            header("Location:error.php?message=".$e->getMessage());
      }
    } 
  }

?>

            <div class="input-group custom-search-form">
                <fieldset>
                  <legend><?= empty($_SESSION["message"])?"Login or register":$_SESSION["message"] ?></legend>
                  <form method="post" action="login.php">
                    eMail<input class="form-control" type="email" name="email" required><br>
                    Password<input class="form-control" type="password" name="password" required><br>
                    &nbsp;<br>
                    <button class="btn btn-default" type="submit" name="btnLogin">Login</button><br>
                    <br>
                    <label><input type="checkbox" name="register" value="1">&nbsp;&nbsp;Create new account</label>
                  </form>
                </fieldset>
            </div>


<?php include('footer.php'); ?>
