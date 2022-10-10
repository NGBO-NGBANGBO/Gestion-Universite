<?php

require('database.php');

//Validation du formulaire
if(isset($_POST['Submit'])){

    //Vérifier si l'user a bien complété tous les champs
    if(!empty($_POST['code']) AND !empty($_POST['annee_u'])){
        
        //Les données de l'user
        $code = htmlspecialchars($_POST['code']);
        $annee_u = htmlspecialchars($_POST['annee_u']);
        
       
            //Vérifier si l'étudiant existe déjà sur le site
        $checkIfGroupAlreadyExists = $bdd->prepare('SELECT Code_Classe FROM groupe WHERE Code_Classe = ?');
        $checkIfGroupAlreadyExists->execute(array($code));

        if($checkIfGroupAlreadyExists->rowCount() == 0){
            
            //Insérer l'utilisateur dans la bdd
            $insertGroupOnWebsite = $bdd->prepare('INSERT INTO groupe(Code_Classe,Annee_Universitaire) VALUES(?,?)');
            $insertGroupOnWebsite->execute(array($code,$annee_u));

            $successMsg= "Le groupe a été ajouté avec succés";
           

            //Rediriger l'utilisateur vers la page d'accueil
            //header('Location: index.php');

        }else{
            $errorMsg = "Le groupe existe déjà sur le site";
        }

    }else{
        $errorMsg = "Veuillez compléter tous les champs...";
    }

}
?>