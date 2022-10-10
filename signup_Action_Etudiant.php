<?php

require('database.php');

//Validation du formulaire
if(isset($_POST['Submit'])){

    //Vérifier si l'user a bien complété tous les champs
    if(!empty($_POST['cni']) AND !empty($_POST['cnm']) AND !empty($_POST['cne']) AND !empty($_POST['nom']) AND !empty($_POST['prenom']) AND !empty($_POST['email']) AND !empty($_POST['boursier']) AND !empty($_POST['date_naissance']) AND !empty($_POST['lieu_naissance']) AND !empty($_POST['num_tel']) AND !empty($_POST['date_inscription'])){
        
        //Les données de l'user
        $cni = htmlspecialchars($_POST['cni']);
        $cnm = htmlspecialchars($_POST['cnm']);
        $cne = htmlspecialchars($_POST['cne']);
        $nom = htmlspecialchars($_POST['nom']);
        $prenom = htmlspecialchars($_POST['prenom']);
        $email = htmlspecialchars($_POST['email']);
        $boursier = htmlspecialchars($_POST['boursier']);
        $date1=strtr($_REQUEST['date_naissance'], '/', '-');
        $date_naissance= date('Y-m-d', strtotime($date1));
        $lieu_naissance = $_POST['lieu_naissance'];
        $num_tel = $_POST['num_tel'];
        $date2=strtr($_REQUEST['date_inscription'], '/', '-');
        $date_inscription= date('Y-m-d', strtotime($date2));
        $code_classe = $_POST['code_classe'];
            //Vérifier si l'étudiant existe déjà sur le site
        $checkIfUserAlreadyExists = $bdd->prepare('SELECT CIN FROM etudiant WHERE CIN = ?');
        $checkIfUserAlreadyExists->execute(array($cni));

        if($checkIfUserAlreadyExists->rowCount() == 0){
            
            //Insérer l'utilisateur dans la bdd
            $insertUserOnWebsite = $bdd->prepare('INSERT INTO etudiant(CIN,CNM,CNE,Nom,Prenom,Email,Boursier,DatedeNaissance,LieudeNaissance,Num_Tel,DateInscription,Code_Classe) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)');
            $insertUserOnWebsite->execute(array($cni,$cnm,$cne,$nom,$prenom,$email,$boursier,$date_naissance,$lieu_naissance,$num_tel,$date_inscription,$code_classe));

            $successMsg= "L'étudiant a été ajouté avec succés";
           

            //Rediriger l'utilisateur vers la page d'accueil
            //header('Location: index.php');

        }else{
            $errorMsg = "L'étudiant existe déjà sur le site";
        }

    }else{
        $errorMsg = "Veuillez compléter tous les champs...";
    }

}
?>