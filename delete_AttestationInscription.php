<?php
//including the database connection file
require('database.php');
 
//getting id of the data from url
$ReferenceRecu = $_GET['Reference_Reçu'];
 
//deleting the row from table
$deleteThisAttestation = $bdd->prepare('DELETE FROM paiement WHERE Reference_Reçu = ?');
$deleteThisAttestation->execute(array($ReferenceRecu));

 
//redirecting to the display page (index.php in our case)
header("Location:liste_AttestationInscription.php");
?>