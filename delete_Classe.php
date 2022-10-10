<?php
//including the database connection file
require('database.php');
 
//getting id of the data from url
$id = $_GET['Code_Classe'];
 
//deleting the row from table
$deleteThisClasse = $bdd->prepare('DELETE FROM classe WHERE Code_Classe = ?');
$deleteThisClasse->execute(array($id));

 
//redirecting to the display page (index.php in our case)
header("Location:affichage_liste_classe.php");
?>