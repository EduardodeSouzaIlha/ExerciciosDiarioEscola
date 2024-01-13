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

$arrayDeNascimento = [
    'Francisco Souza' => '10-12-1996',
    'Arthur Golveia' => '14-01-2000',
    'Guilherme Rosa' => '26-05-1985',
    'Marcelo Planalto' => '26-05-1985'
];

foreach ($arrayDeClientes as $cliente) {
    $nomeCliente = $cliente->nome; 

    if (isset($arrayDeNascimento[$nomeCliente])) { //Primeiro é necessário varificar se o nome se encontra no arrayDeNascimento
        $cliente->dataNascimento = $arrayDeNascimento[$nomeCliente]; //Aqui atribui a data de nascimento para para o cliente 
    }
}
echo('<br/>' . $arrayDeClientes[1]->dataNascimento);


// Pergunta 3
function compararPorDataNascimento($cliente1, $cliente2) {
    $dataNascimento1 = strtotime($cliente1->dataNascimento); //passa a data para a quantidade de segundos desde 1970
    $dataNascimento2 = strtotime($cliente2->dataNascimento);
    
    return $dataNascimento1 - $dataNascimento2; 
}


usort($arrayDeClientes, 'compararPorDataNascimento'); //Essa função irá comparar por data de nascimento de dois em dois


echo "<pre>";
print_r($arrayDeClientes);
echo "</pre>";
?>
</body>
</html>