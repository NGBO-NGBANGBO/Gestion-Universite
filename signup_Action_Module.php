<?php

require('database.php');

//Validation du formulaire
if(isset($_POST['Submit'])){

    //Vérifier si l'user a bien complété tous les champs
    if(!empty($_POST['module']) AND !empty($_POST['type']) AND !empty($_POST['coef'])){
        
        //Les données de l'user
        $module = htmlspecialchars($_POST['module']);
        $type = htmlspecialchars($_POST['type']);
        $coef = htmlspecialchars($_POST['coef']);
        $code_classe = htmlspecialchars($_POST['code_classe']);
       
            //Vérifier si le module existe déjà sur le site
        $checkIfModuleAlreadyExists = $bdd->prepare('SELECT NomModule,Code_Classe FROM module WHERE NomModule = ? AND Code_Classe=?');
        $checkIfModuleAlreadyExists->execute(array($module,$code_classe));

        if($checkIfModuleAlreadyExists->rowCount() == 0){
            
            //Insérer l'utilisateur dans la bdd
            $insertModuleOnWebsite = $bdd->prepare('INSERT INTO module(NomModule,Type,Coefficient,Code_Classe) VALUES(?,?,?,?)');
            $insertModuleOnWebsite->execute(array($module,$type,$coef,$code_classe));

            $successMsg= "Le module a été ajouté avec succés";
           

            //Rediriger l'utilisateur vers la page d'accueil
            //header('Location: index.php');

        }else{
            $errorMsg = "Le module existe déjà sur le site";
        }

    }else{
        $errorMsg = "Veuillez compléter tous les champs...";
    }

}
?>