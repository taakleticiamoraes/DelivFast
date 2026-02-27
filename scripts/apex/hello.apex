// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

Produto pizza = new Produto('Pizza Calabresa', 45.0);
Produto hamburguer = new Produto('Hamburguer Artesanal', 30.0);

Restaurante restaurante = new Restaurante(
    'Food House',
    'Rua das Flores',
    CategoriaRestaurante.PIZZARIA
);

restaurante.adicionarProduto(pizza);
restaurante.adicionarProduto(hamburguer);

System.debug(restaurante);
System.debug(restaurante.cardapio);