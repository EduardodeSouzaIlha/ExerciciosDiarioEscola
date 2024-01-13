 
/* Pergunta 1 */

    var clientes = [ //Mudei as {} para que seja um array de objetos
        {
          'id': 1,
          'nome': 'Luis Santos Silveira',
          'idade': 18
        },
        {
          'id': 2,
          'nome': 'Ricardo Lopes Alvez',
          'idade': 30
        },
        {
          'id': 3,
          'nome': 'Gustavo Silva Junior',
          'idade': 26
        }
    ];

    clientes.forEach(cliente => {
         let name = cliente.nome;
         const [first, middle, last ] = name.split(' '); //Usando desestruturação com o resultado da função
         console.log(`${last ? last : "Não tem ultimo nome"}, ${middle ? middle : "Não tem nome do meio"}` ) //Caso fossem adicionados mais é possivel que nem todos tenham sobrenomes
    });

/* Pergunta 2 */

  var numero = "5(1)9-876-543-21";



var clearNumber = numero.replace(/[^\d]/g, ''); //Aqui apenas estou permitindo que fiquem caracteres numericos, substituindo eles por ''

var formatedNumber = clearNumber.replace(/(\d{2})(\d)(\d{4})(\d{4})/, '($1)_$2_$3-$4'); //Aqui estou separando em 4 grupos, consecutivamente os primeiros 2 dígitos e os seguintes 1, 4, 4 digitos 

console.log(formatedNumber);


/* Bônus 3 */

/*
 
 - A ordem será respectivamente: "A função é C", "A função é D"

*/

/* Bônus 4 */

/* 
 O erro é concatenar um caracter com aspas duplas com a string de aspas simples:
 alertUser("a");
 console.log('A função é: ' + message);
*/