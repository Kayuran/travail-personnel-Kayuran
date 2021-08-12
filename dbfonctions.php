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
 * Récupère les films dans un certain ordre
 * @param string  $order     Nom de la colonne pour trier les pays affichés
 * @param string  $direction Sens de tri de l'affichage
 * @param boolean $filter    Filtre actif ou pas
 * @param int     $idUser    Identifiant utilisateur connecte
 * @param string  $mode      verbose=deboggage or quiet=production, indique si le select est affiché ou pas pour l'utilisateur
 * @return array tableau des pays
 */
function getPays($order, $direction, $filter, $idUser, $mode) {
	try {


        if ($filter) {

            $query = "SELECT * FROM movies WHERE idIMDB NOT IN (SELECT FK_idIMDB FROM feedback WHERE FK_idUser = :idUser) ORDER BY $order $direction";
            debug($mode, $query); // Pour déboggage uniquement à la base, mais laissé car sympa de voir le SQL            
            $request = myConnection()->prepare($query);
            $request->bindParam(':idUser', $idUser, PDO::PARAM_STR);
            $request->execute();

        } else {

            $query = "SELECT * FROM movies ORDER BY $order $direction";        
            debug($mode, $query); // Pour déboggage uniquement à la base, mais laissé car sympa de voir le SQL
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
function getOneMovie($idPRE) {
    try {
        $request = myConnection()->prepare("SELECT * FROM movies WHERE idIMDB = :idIMDB");
        $request->bindParam(':idIMDB', $idIMDB, PDO::PARAM_STR);
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
 * Récupère l'avis de l'utilisateur par rapport au film
 * @param int $idUser identifiant de l'utilisateur
 * @param string $idIMDB identifiant du film
 * @return int avis (-1 disliked, 0 neutral, 1 loved, 99 unseen)
 */
function getFeedback($idUser, $idIMDB) {
    //assert(avis does already exist)
    try {
        $request = myConnection()->prepare("SELECT ranking FROM feedback WHERE FK_idUser = :idUser AND FK_idIMDB = :idIMDB");
        $request->bindParam(':idUser', $idUser, PDO::PARAM_STR);
        $request->bindParam(':idIMDB', $idIMDB, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
    $ranking = $request->fetch(PDO::FETCH_ASSOC);
    return ((!empty($ranking))?$ranking["ranking"]:99);
}

/**
 * Crée, supprime ou met à jour l'avis de l'utilisateur
 * @param int $idUser identifiant de l'utilisateur
 * @param string $idIMDB identifiant du film
 * @param int ranking (-1 disliked, 0 neutral, 1 loved)
 */
function setFeedback($idUser, $idIMDB, $ranking) {
    $feedback = getFeedback($idUser, $idIMDB);
    switch($feedback) {
        case -1:
            switch($ranking) {
                case -1:
                    break;
                case 0:
                case 1:
                    updateFeedback($idUser, $idIMDB, $ranking);
                    break;
                case 99:
                    removeFeedback($idUser, $idIMDB);
                    break;
            }
            break;
        case 0:
            switch($ranking) {
                case 0:
                    break;
                case -1:
                case 1:
                    updateFeedback($idUser, $idIMDB, $ranking);
                    break;
                case 99:
                    removeFeedback($idUser, $idIMDB);
                    break;
            }
            break;
        case 1:
            switch($ranking) {
                case 1:
                    break;
                case -1:
                case 0:
                    updateFeedback($idUser, $idIMDB, $ranking);
                    break;
                case 99:
                    removeFeedback($idUser, $idIMDB);
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
                    createFeedback($idUser, $idIMDB, $ranking);
                    break;
            }
            break;
    }
}

/**
 * Ajoute un avis de l'utilisateur sur un film
 * @param int $idUser identifiant de l'utilisateur
 * @param string $idIMDB identifiant du film
 * @param int ranking (-1 disliked, 0 neutral, 1 loved)
 */
function createFeedback($idUser, $idIMDB, $ranking) {
    //assert(avis doesn't already exist)
    if ($ranking == -1 || $ranking == 0 || $ranking == 1) {
        try {
            $request = myConnection()->prepare("INSERT INTO feedback (ranking, FK_idIMDB, FK_idUser) VALUES (:ranking, :idIMDB, :idUser)");
            $request->bindParam(':idUser', $idUser, PDO::PARAM_INT);
            $request->bindParam(':idIMDB', $idIMDB, PDO::PARAM_STR);
            $request->bindParam(':ranking',$ranking,PDO::PARAM_INT);
            $request->execute();
        } catch (PDOException $e) {
            header("Location:error.php?message=".$e->getMessage());
        }
    }
}

/**
 * Modifie l'avis de l'utilisateur pour un film
 * @param int $idUser identifiant de l'utilisateur
 * @param string $idIMDB identifiant du film
 * @param int ranking (-1 disliked, 0 neutral, 1 loved)
 */
function updateFeedback($idUser, $idIMDB, $ranking) {
    //assert(avis does already exist)
    if ($ranking == -1 || $ranking == 0 || $ranking == 1) {
        try {
            $request = myConnection()->prepare("UPDATE feedback SET ranking = :ranking WHERE FK_idUser = :idUser AND FK_idIMDB = :idIMDB");
            $request->bindParam(':idUser', $idUser, PDO::PARAM_INT);
            $request->bindParam(':idIMDB', $idIMDB, PDO::PARAM_STR);
            $request->bindParam(':ranking',$ranking,PDO::PARAM_INT);
            $request->execute();
        } catch (PDOException $e) {
            header("Location:error.php?message=".$e->getMessage());
        }
    }
}

/**
 * Supprime l'avis de l'utilisateur pour un film (marque le film non vu)
 * @param int $idUser identifiant de l'utilisateur
 * @param string $idIMDB identifiant du film
 */
function removeFeedback($idUser, $idIMDB) {
    //assert(avis does already exist)
    try {
        $request = myConnection()->prepare("DELETE FROM feedback WHERE FK_idUser = :idUser AND FK_idIMDB = :idIMDB");
        $request->bindParam(':idUser', $idUser, PDO::PARAM_INT);
        $request->bindParam(':idIMDB', $idIMDB, PDO::PARAM_STR);
        $request->execute();
    } catch (PDOException $e) {
        header("Location:error.php?message=".$e->getMessage());
    }
}
