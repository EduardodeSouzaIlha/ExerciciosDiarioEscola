<!DOCTYPE html>
<html>
<body>

<?php

// Pergunta 1

$nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
$cliente1 = new stdClass();
$cliente1->nome = $nomes[0];

$cliente2 = new stdClass();
$cliente2->nome = $nomes[1];

$cliente3 = new stdClass();
$cliente3->nome = $nomes[2];

$arrayDeClientes = [$cliente1, $cliente2, $cliente3];

echo($arrayDeClientes[1]->nome);

// Pergunta 2 



?>
</body>
</html>