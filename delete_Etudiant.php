<?php
//including the database connection file
require('database.php');
 
//getting id of the data from url
$id = $_GET['id'];
 
//deleting the row from table
$deleteThisEtudiant = $bdd->prepare('DELETE FROM etudiant WHERE id = ?');
$deleteThisEtudiant->execute(array($id));

 
//redirecting to the display page (index.php in our case)
header("Location:affichage_liste_etudiant.php");
?>