<?php

require('database.php');

//Validation du formulaire
if(isset($_POST['Submit'])){

    //Vérifier si l'user a bien complété tous les champs
    if(!empty($_POST['ReferenceRecu']) AND !empty($_POST['DateRecu']) AND !empty($_POST['DateremiseRecu'])){
        
        //Les données de l'user
        $ReferenceRecu = htmlspecialchars($_POST['ReferenceRecu']);
        $date1=strtr($_REQUEST['DateRecu'], '/', '-');
        $DateRecu= date('Y-m-d', strtotime($date1));
        $date2=strtr($_REQUEST['DateremiseRecu'], '/', '-');
        $DateremiseRecu= date('Y-m-d', strtotime($date2));

            //Vérifier si l'étudiant existe déjà sur le site
        $checkIfUserAlreadyExists = $bdd->prepare('SELECT Reference_Reçu FROM paiement WHERE Reference_Reçu = ?');
        $checkIfUserAlreadyExists->execute(array($ReferenceRecu));

        if($checkIfUserAlreadyExists->rowCount() == 0){
            
            //Insérer l'utilisateur dans la bdd
            $insertUserOnWebsite = $bdd->prepare('INSERT INTO paiement( Reference_Reçu,Date_Reçu,Date_remise_Reçu) VALUES(?,?,?)');
            $insertUserOnWebsite->execute(array( $ReferenceRecu,$DateRecu,$DateremiseRecu));

            $successMsg= "L''attestation a été ajouté avec succés";
           

            //Rediriger l'utilisateur vers la page d'accueil
            //header('Location: index.php');

        }else{
            $errorMsg = "L'attestation existe déjà sur le site";
        }

    }else{
        $errorMsg = "Veuillez compléter tous les champs...";
    }

}
?>