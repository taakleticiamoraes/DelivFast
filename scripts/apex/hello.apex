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


// =========================
// RESTAURANTE BASE
// =========================
Restaurante restaurante = new Restaurante(
    'Bella Pizza',
    'Av antártico 381',
    CategoriaRestaurante.PIZZARIA
);

// =========================
// PRODUTOS BASE
// =========================
Produto pizzaMussarela = new Produto('Pizza Mussarela', 35.00);
Produto pizzaCalabresa = new Produto('Pizza Calabresa', 38.00);
Produto refrigerante = new Produto('Refrigerante', 8.00);
Produto pastel = new Produto('Pastel', 6.50);

System.debug('=== TESTE ADICIONAR PRODUTO ===');

restaurante.adicionarProduto(pizzaMussarela);
restaurante.adicionarProduto(pizzaMussarela); // duplicado
restaurante.adicionarProduto(refrigerante);

System.debug('Quantidade no cardápio: ' + restaurante.cardapio.size());

System.debug('=== TESTE EXIBIR CARDAPIO ===');

Restaurante restaurante2 = new Restaurante(
    'Bella Pizza',
    'Av antártico 381',
    CategoriaRestaurante.PIZZARIA
);

restaurante2.exibirCardapio();

restaurante2.adicionarProduto(pizzaMussarela);
restaurante2.adicionarProduto(refrigerante);

restaurante2.exibirCardapio();

System.debug('=== TESTE BUSCAR PRODUTOS ===');

Restaurante restaurante3 = new Restaurante(
    'Bella Pizza',
    'Av antártico 381',
    CategoriaRestaurante.PIZZARIA
);

restaurante3.adicionarProduto(pizzaMussarela);
restaurante3.adicionarProduto(pizzaCalabresa);
restaurante3.adicionarProduto(refrigerante);
restaurante3.adicionarProduto(pastel);

restaurante3.buscarProdutos('pizza');

restaurante3.buscarProdutos('calabresa');

restaurante3.buscarProdutos('batata');