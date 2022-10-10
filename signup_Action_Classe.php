<?php

require('database.php');

//Validation du formulaire
if(isset($_POST['Submit'])){

    //Vérifier si l'user a bien complété tous les champs
    if(!empty($_POST['code_classe']) AND !empty($_POST['annee_universitaire']) AND !empty($_POST['semestre']) AND !empty($_POST['niveau'])){
        
        //Les données de l'user
        $code_classe = htmlspecialchars($_POST['code_classe']);
        $annee_universitaire = htmlspecialchars($_POST['annee_universitaire']);
        $semestre = htmlspecialchars($_POST['semestre']);
        $niveau = htmlspecialchars($_POST['niveau']);
       
            //Vérifier si le module existe déjà sur le site
        $checkIfClasseAlreadyExists = $bdd->prepare('SELECT Code_Classe FROM classe WHERE Code_Classe = ?');
        $checkIfClasseAlreadyExists->execute(array($code_classe));

        if($checkIfClasseAlreadyExists->rowCount() == 0){
            
            //Insérer l'utilisateur dans la bdd
            $insertClasseOnWebsite = $bdd->prepare('INSERT INTO classe(Code_Classe,Annee_Universitaire,Semestre,Niveau) VALUES(?,?,?,?)');
            $insertClasseOnWebsite->execute(array($code_classe,$annee_universitaire,$niveau,$niveau));

            $successMsg= "La classe a été ajouté avec succés";
           

            //Rediriger l'utilisateur vers la page d'accueil
            //header('Location: index.php');

        }else{
            $errorMsg = "La classe existe déjà...";
        }

    }else{
        $errorMsg = "Veuillez compléter tous les champs...";
    }

}
?>