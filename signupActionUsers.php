<?php
//session_start();
require('database.php');

//Validation du formulaire
if(isset($_POST['validate'])){

    //Vérifier si l'user a bien complété tous les champs
    if(!empty($_POST['role']) AND !empty($_POST['email']) AND !empty($_POST['password'])){
        
        //Les données de l'user
        $user_role = htmlspecialchars($_POST['role']);
        $user_email = htmlspecialchars($_POST['email']);
        $user_password = password_hash($_POST['password'], PASSWORD_DEFAULT);

        //Vérifier si l'utilisateur existe déjà sur le site
        $checkIfUserAlreadyExists = $bdd->prepare('SELECT email FROM users WHERE email = ?');
        $checkIfUserAlreadyExists->execute(array($user_email));

        if($checkIfUserAlreadyExists->rowCount() == 0){
            
            //Insérer l'utilisateur dans la bdd
            $insertUserOnWebsite = $bdd->prepare('INSERT INTO users(role, email, password)VALUES(?, ?, ?)');
            $insertUserOnWebsite->execute(array($user_role, $user_email, $user_password));

            //Récupérer les informations de l'utilisateur
            $getInfosOfThisUserReq = $bdd->prepare('SELECT id, role, email, password FROM users WHERE password = ? AND email = ? AND role = ?');
            $getInfosOfThisUserReq->execute(array($user_password, $user_email, $user_role));

            $usersInfos = $getInfosOfThisUserReq->fetch();

            //Authentifier l'utilisateur sur le site et récupérer ses données dans des variables globales sessions
            $_SESSION['auth'] = true;
            $_SESSION['id'] = $usersInfos['id'];
            $_SESSION['email'] = $usersInfos['email'];
            $_SESSION['role'] = $usersInfos['role'];

            //Rediriger l'utilisateur vers la page d'accueil
        // header('Location: signupUsers.php');
            $successMsg="L'utilisateur a été bien ajouté avec succés";

        }else{
            $errorMsg = "L'utilisateur existe déjà sur le site";
        }

    }else{
        $errorMsg = "Veuillez compléter tous les champs...";
    }

}