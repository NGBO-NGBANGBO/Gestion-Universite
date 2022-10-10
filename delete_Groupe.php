<?php
//including the database connection file
require('database.php');
 
//getting id of the data from url
$id = $_GET['id_Groupe'];
 
//deleting the row from table
$deleteThisGroupe = $bdd->prepare('DELETE FROM groupe WHERE id_Groupe = ?');
$deleteThisGroupe->execute(array($id));

 
//redirecting to the display page (index.php in our case)
header("Location:affichage_liste_groupe.php");
?>