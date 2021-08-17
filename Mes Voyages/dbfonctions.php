<?php

/* * * * * * * * * * * * * * * * * *
 * - Mahesalingam Kayuran - ESIG
 * * * * * * * * * * * * * * * * * */

DEFINE('DB_USER', 'root');
DEFINE('DB_PASSWORD', '');
DEFINE('DB_HOST', '127.0.0.1');
DEFINE('DB_NAME', 'voyage');

/**
 * Connexion à la base
 * @staticvar type $dbc
 * @return \PDO
 */
function myConnection() {
    static $dbc = null;
    if ($dbc == null) {
        try {
            $dbc = new PDO('mysql: host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8', DB_USER, DB_PASSWORD);
        } catch (PDOException $e) {
            header("Location:error.php?message=".$e->getMessage());
        }
    }
    return $dbc;
}


/**
 * Récupère les prestations dans un certain ordre
 * @param string  $order     Nom de la colonne pour trier les prestations affichées
 * @param string  $direction Sens de tri de l'affichage
 * @param boolean $filter    Filtre actif ou pas
 * @param int     $idUser    Identifiant utilisateur connecte
 * @param string  $mode      verbose=deboggage or quiet=production, indique si le select est affiché ou pas pour l'utilisateur
 * @return array tableau des pays
 */
function getPays($order, $direction, $filter, $idUser, $mode) {
	try {


        if ($filter) {

            $query = "SELECT * FROM prestation WHERE idPRE NOT IN (SELECT prestation_idPRE FROM feedback WHERE users_idUser = :idUser) ORDER BY $order $direction";        
            $request = myConnection()->prepare($query);
            $request->bindParam(':idUser', $idUser, PDO::PARAM_STR);
            $request->execute();

        } else {

            $query = "SELECT * FROM prestation ORDER BY $order $direction";        
            $request = myConnection()->prepare($query); 
            $request->execute();

        }

	} catch (PDOException $e) {
		header("Location:error.php?message=".$e->getMessage());
	}
    return $request->fetchAll(PDO::FETCH_ASSOC);
}

/**
 * Récupère les informations d'une prestation
 * @param string $idPRE Identifiant de la prestation
 * @return array Tableau des informations
 */
function getOnePays($idPRE) {
    try {
        $request = myConnection()->prepare("SELECT * FROM prestation WHERE idPRE = :idPRE");
        $request->bindParam(':idPRE', $idPRE, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
    return $request->fetch(PDO::FETCH_ASSOC);
}


/**
 * Récupère les hotels dans un certain ordre
 * @param string  $order     Nom de la colonne pour trier les pays affichés
 * @param string  $direction Sens de tri de l'affichage
 * @param boolean $filter    Filtre actif ou pas
 * @param int     $idUser    Identifiant utilisateur connecte
 * @param string  $mode      verbose=deboggage or quiet=production, indique si le select est affiché ou pas pour l'utilisateur
 * @return array tableau des pays
 */
function getHotel($order, $direction, $filter, $idUser, $mode) {


            $query = "SELECT * FROM hotel ORDER BY $order $direction";        
            $request = myConnection()->prepare($query); 
            $request->execute();


	
    return $request->fetchAll(PDO::FETCH_ASSOC);
}

/**
 * Récupère les informations d'un hotel
 * @param string $idHOT Identifiant de la prestation
 * @return array Tableau des informations
 */
function getOnehotel($idHOT) {
    try {
        $request = myConnection()->prepare("SELECT * FROM hotel WHERE idHOT = :idHOT");
        $request->bindParam(':idHOT', $idHOT, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
    return $request->fetch(PDO::FETCH_ASSOC);
}

/**
 * Ajoute un utilisateur
 * @param string $email E-mail
 * @param string $password Mot de passe
 */
function createUser($email, $password) {
    $email = strtolower($email);
    try {
        $request = myConnection()->prepare("INSERT INTO users (eMail,password) VALUES(:email, :password)");
        $request->bindParam(':email', $email, PDO::PARAM_STR);
        $request->bindParam(':password', $password, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
}


/**
 * Récupère un utilisateur
 * @param string $email email
 * @return array tableau des informations d'un film
 */
function getOneUser($email) {
    $email = strtolower($email);
    try {
        $request = myConnection()->prepare("SELECT * FROM users WHERE email = :email");
        $request->bindParam(':email', $email, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
    return $request->fetch(PDO::FETCH_ASSOC);
}

/**
 * Récupère l'avis de l'utilisateur par rapport à la prestation
 * @param int $idUSER identifiant de l'utilisateur
 * @param string $idPRE identifiant de la prestation
 * @return int avis (-1 disliked, 0 neutral, 1 loved, 99 unseen)
 */
function getFeedback($idUSER, $idPRE) {
    //assert(avis does already exist)
    try {
        $request = myConnection()->prepare("SELECT ranking FROM feedback WHERE users_idUser = :idUSER AND prestation_idPRE = :idPRE");
        $request->bindParam(':idUSER', $idUser, PDO::PARAM_STR);
        $request->bindParam(':idPRE', $idIMDB, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
    $ranking = $request->fetch(PDO::FETCH_ASSOC);
    return ((!empty($ranking))?$ranking["ranking"]:99);
}

/**
 * Crée, supprime ou met à jour l'avis de l'utilisateur
 * @param int $idUSER identifiant de l'utilisateur
 * @param string $idPRE identifiant du film
 * @param int ranking (-1 disliked, 0 neutral, 1 loved)
 */
function setFeedback($idUSER, $idPRE, $ranking) {
    $feedback = getFeedback($idUSER, $idPRE);
    switch($feedback) {
        case -1:
            switch($ranking) {
                case -1:
                    break;
                case 0:
                case 1:
                    updateFeedback($idUSER, $idPRE, $ranking);
                    break;
                case 99:
                    removeFeedback($idUSER, $idPRE);
                    break;
            }
            break;
        case 0:
            switch($ranking) {
                case 0:
                    break;
                case -1:
                case 1:
                    updateFeedback($idUSER, $idPRE, $ranking);
                    break;
                case 99:
                    removeFeedback($idUSER, $idPRE);
                    break;
            }
            break;
        case 1:
            switch($ranking) {
                case 1:
                    break;
                case -1:
                case 0:
                    updateFeedback($idUSER, $idPRE, $ranking);
                    break;
                case 99:
                    removeFeedback($idUSER, $idPRE);
                    break;
            }
            break;
        case 99:
            switch($ranking) {
                case 99:
                    break;
                case -1:
                case 0:
                case 1:
                    createFeedback($idUSER, $idPRE, $ranking);
                    break;
            }
            break;
    }
}

/**
 * Ajoute un avis de l'utilisateur sur une prestation
 * @param int $idUser identifiant de l'utilisateur
 * @param string $idPRE identifiant de la prestation
 * @param int ranking (-1 disliked, 0 neutral, 1 loved)
 */
function createFeedback($idUSER, $idPRE, $ranking) {
    //assert(avis doesn't already exist)
    if ($ranking == -1 || $ranking == 0 || $ranking == 1) {
        try {
            $request = myConnection()->prepare("INSERT INTO feedback (ranking, prestation_idPRE, users_idUSER) VALUES (:ranking, :idPRE, :idUSER)");
            $request->bindParam(':idUSER', $idUser, PDO::PARAM_INT);
            $request->bindParam(':idPRE', $idIMDB, PDO::PARAM_STR);
            $request->bindParam(':ranking',$ranking,PDO::PARAM_INT);
            $request->execute();
        } catch (PDOException $e) {
            header("Location:error.php?message=".$e->getMessage());
        }
    }
}

/**
 * Modifie l'avis de l'utilisateur pour une prestation
 * @param int $idUSER identifiant de l'utilisateur
 * @param string $idPRE identifiant de la prestation
 * @param int ranking (-1 disliked, 0 neutral, 1 loved)
 */
function updateFeedback($idUSER, $idPRE, $ranking) {
    //assert(avis does already exist)
    if ($ranking == -1 || $ranking == 0 || $ranking == 1) {
        try {
            $request = myConnection()->prepare("UPDATE feedback SET ranking = :ranking WHERE users_idUSER = :idUSER AND prestation_idPRE = :idPRE");
            $request->bindParam(':idUSER', $idUser, PDO::PARAM_INT);
            $request->bindParam(':idPRE', $idIMDB, PDO::PARAM_STR);
            $request->bindParam(':ranking',$ranking,PDO::PARAM_INT);
            $request->execute();
        } catch (PDOException $e) {
            header("Location:error.php?message=".$e->getMessage());
        }
    }
}

/**
 * Supprime l'avis de l'utilisateur pour une prestation (marque la prestation non vu)
 * @param int $idUSER identifiant de l'utilisateur
 * @param string $idPRE identifiant de la prestation
 */
function removeFeedback($idUSER, $idPRE) {
    //assert(avis does already exist)
    try {
        $request = myConnection()->prepare("DELETE FROM feedback WHERE users_idUSER = :idUSER AND prestation_idPRE = :idPRE");
        $request->bindParam(':idUSER', $idUser, PDO::PARAM_INT);
        $request->bindParam(':idPRE', $idIMDB, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
}
