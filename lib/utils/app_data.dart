// Importe os modelos de dados
import '../models/category.dart';
import '../models/pictogram.dart';

// --- Palavras Essenciais (Core Vocabulary) ---

// Uma classe para as palavras essenciais, que são usadas com alta frequência
class CoreWord {
  const CoreWord({required this.keyword, required this.imagePath});

  final String keyword;
  final String imagePath;
}

// Lista das palavras essenciais. Elas podem ser exibidas em uma área fixa na tela.
final List<CoreWord> kCoreWords = [
  const CoreWord(
    keyword: 'Eu',
    imagePath: 'assets/images/palavras_essenciais/eu.png',
  ),
  const CoreWord(
    keyword: 'Você',
    imagePath: 'assets/images/palavras_essenciais/voce.png',
  ),
  const CoreWord(
    keyword: 'Eu quero',
    imagePath: 'assets/images/palavras_essenciais/eu_quero.png',
  ),
  const CoreWord(
    keyword: 'Eu gosto',
    imagePath: 'assets/images/palavras_essenciais/eu_gosto.png',
  ),
  const CoreWord(
    keyword: 'Eu não gosto',
    imagePath: 'assets/images/palavras_essenciais/eu_nao_gosto.png',
  ),
  const CoreWord(
    keyword: 'Mais',
    imagePath: 'assets/images/palavras_essenciais/mais.png',
  ),
  const CoreWord(
    keyword: 'Outro',
    imagePath: 'assets/images/palavras_essenciais/outro.png',
  ),
  const CoreWord(
    keyword: 'Grande',
    imagePath: 'assets/images/palavras_essenciais/grande.png',
  ),
  const CoreWord(
    keyword: 'Pequeno',
    imagePath: 'assets/images/palavras_essenciais/pequeno.png',
  ),
  const CoreWord(
    keyword: 'Bom',
    imagePath: 'assets/images/palavras_essenciais/bom.png',
  ),
  const CoreWord(
    keyword: 'Ruim',
    imagePath: 'assets/images/palavras_essenciais/ruim.png',
  ),
  const CoreWord(
    keyword: 'O quê?',
    imagePath: 'assets/images/palavras_essenciais/o_que.png',
  ),
  const CoreWord(
    keyword: 'Onde?',
    imagePath: 'assets/images/palavras_essenciais/onde.png',
  ),
  const CoreWord(
    keyword: 'Quem?',
    imagePath: 'assets/images/palavras_essenciais/quem.png',
  ),
  const CoreWord(
    keyword: 'Olá',
    imagePath: 'assets/images/palavras_essenciais/ola.png',
  ),
  const CoreWord(
    keyword: 'Tchau',
    imagePath: 'assets/images/palavras_essenciais/tchau.png',
  ),
  const CoreWord(
    keyword: 'Por favor',
    imagePath: 'assets/images/palavras_essenciais/por_favor.png',
  ),
  const CoreWord(
    keyword: 'Obrigado',
    imagePath: 'assets/images/palavras_essenciais/obrigado.png',
  ),
  const CoreWord(
    keyword: 'Desculpa',
    imagePath: 'assets/images/palavras_essenciais/desculpa.png',
  ),
];

// --- Categorias de Pictogramas (Fringe Vocabulary) ---

// Lista de categorias para o menu principal
final List<Category> kCategories = [
  const Category(
    name: 'Comida',
    searchKeyword: 'comida',
    imagePath: 'assets/images/comida/comida.png',
  ),
  const Category(
    name: 'Animais',
    searchKeyword: 'animais',
    imagePath: 'assets/images/animais/gato.png',
  ),
  const Category(
    name: 'Ações',
    searchKeyword: 'acoes',
    imagePath: 'assets/images/acoes/ação.png',
  ),
  const Category(
    name: 'Pessoas',
    searchKeyword: 'pessoas',
    imagePath: 'assets/images/pessoas/pessoas.png',
  ),
  const Category(
    name: 'Lugares',
    searchKeyword: 'lugares',
    imagePath: 'assets/images/lugares/lugar.png',
  ),
  const Category(
    name: 'Sentimentos',
    searchKeyword: 'sentimentos',
    imagePath: 'assets/images/sentimentos/sentimentos.png',
  ),
  const Category(
    name: 'Objetos',
    searchKeyword: 'objetos',
    imagePath: 'assets/images/objetos/objetos.png',
  ),
  const Category(
    name: 'Rotina',
    searchKeyword: 'rotina',
    imagePath: 'assets/images/rotina/rotina.png',
  ),
  const Category(
    name: 'Cores',
    searchKeyword: 'cores',
    imagePath:
        'assets/images/cores/cores.png', // Exemplo de imagem para a categoria
  ),
  const Category(
    name: 'Saudações',
    searchKeyword: 'saudacoes',
    imagePath: 'assets/images/saudacoes/olá.png', // Exemplo
  ),
  const Category(
    name: 'Pronomes',
    searchKeyword: 'pronomes',
    imagePath: 'assets/images/pronomes/eu.png', // Exemplo
  ),
  const Category(
    name: 'Números',
    searchKeyword: 'numeros',
    imagePath: 'assets/images/numeros/números.png', // Exemplo
  ),
];

// Mapa que conecta a palavra-chave da categoria aos seus pictogramas
final Map<String, List<Pictogram>> kPictogramsByCategory = {
  'comida': [
    const Pictogram(
      keyword: 'Maçã',
      imagePath: 'assets/images/comida/frutas/maca.png',
    ),
    const Pictogram(
      keyword: 'Banana',
      imagePath: 'assets/images/comida/frutas/banana.png',
    ),
    const Pictogram(keyword: 'Pão', imagePath: 'assets/images/comida/pão.png'),
    const Pictogram(
      keyword: 'Pizza',
      imagePath: 'assets/images/comida/pizza.png',
    ),
    const Pictogram(
      keyword: 'Bolo',
      imagePath: 'assets/images/comida/bolo.png',
    ),
    const Pictogram(
      keyword: 'Macarrão',
      imagePath: 'assets/images/comida/macarrão.png',
    ),
    const Pictogram(
      keyword: 'Água',
      imagePath: 'assets/images/comida/água.png',
    ),
    const Pictogram(
      keyword: 'Suco',
      imagePath: 'assets/images/comida/refresco.png',
    ),
    const Pictogram(
      keyword: 'Leite',
      imagePath: 'assets/images/comida/leite.png',
    ),
  ],

  'animais': [
    const Pictogram(
      keyword: 'Gato',
      imagePath: 'assets/images/animais/gato.png',
    ),
    const Pictogram(
      keyword: 'Cachorro',
      imagePath: 'assets/images/animais/cão.png',
    ),
    const Pictogram(
      keyword: 'Vaca',
      imagePath: 'assets/images/animais/vaca.png',
    ),
    const Pictogram(
      keyword: 'Pato',
      imagePath: 'assets/images/animais/pato.png',
    ),
    const Pictogram(
      keyword: 'Leão',
      imagePath: 'assets/images/animais/leão.png',
    ),
  ],

  'acoes': [
    const Pictogram(keyword: 'Ir', imagePath: 'assets/images/acoes/ir.png'),
    const Pictogram(keyword: 'Ter', imagePath: 'assets/images/acoes/ter.png'),
    const Pictogram(
      keyword: 'Fazer',
      imagePath: 'assets/images/acoes/fazer.png',
    ),
    const Pictogram(keyword: 'Ver', imagePath: 'assets/images/acoes/ver.png'),
    const Pictogram(
      keyword: 'Ouvir',
      imagePath: 'assets/images/acoes/ouvir.png',
    ),
    const Pictogram(
      keyword: 'Ajudar',
      imagePath: 'assets/images/acoes/ajudar.png',
    ),
    const Pictogram(keyword: 'Dar', imagePath: 'assets/images/acoes/dar.png'),
    const Pictogram(
      keyword: 'Abrir',
      imagePath: 'assets/images/acoes/abrir.png',
    ),
    const Pictogram(
      keyword: 'Brincar',
      imagePath: 'assets/images/acoes/brincar.png',
    ),
    const Pictogram(
      keyword: 'Desenhar',
      imagePath: 'assets/images/acoes/desenhar.png',
    ),
    const Pictogram(keyword: 'Ler', imagePath: 'assets/images/acoes/ler.png'),
    const Pictogram(
      keyword: 'Dormir',
      imagePath: 'assets/images/acoes/dormir.png',
    ),
    const Pictogram(
      keyword: 'Assistir TV',
      imagePath: 'assets/images/acoes/ver tv.png',
    ),
    const Pictogram(
      keyword: 'Lavar',
      imagePath: 'assets/images/acoes/lavar.png',
    ),
    const Pictogram(
      keyword: 'Comer',
      imagePath: 'assets/images/acoes/comer.png',
    ),
    const Pictogram(
      keyword: 'Beber',
      imagePath: 'assets/images/acoes/beber.png',
    ),
  ],

  'pessoas': [
    const Pictogram(
      keyword: 'Mamãe',
      imagePath: 'assets/images/pessoas/mãe.png',
    ),
    const Pictogram(
      keyword: 'Papai',
      imagePath: 'assets/images/pessoas/pai.png',
    ),
    const Pictogram(
      keyword: 'Vovó',
      imagePath: 'assets/images/pessoas/vovó.png',
    ),
    const Pictogram(
      keyword: 'Vovô',
      imagePath: 'assets/images/pessoas/avô.png',
    ),
    const Pictogram(
      keyword: 'Irmão',
      imagePath: 'assets/images/pessoas/irmão.png',
    ),
    const Pictogram(
      keyword: 'Irmã',
      imagePath: 'assets/images/pessoas/irmã.png',
    ),
    const Pictogram(
      keyword: 'Professor(a)',
      imagePath: 'assets/images/pessoas/professor.png',
    ),
    const Pictogram(
      keyword: 'Amigo(a)',
      imagePath: 'assets/images/pessoas/amigo.png',
    ),
  ],

  'lugares': [
    const Pictogram(
      keyword: 'Casa',
      imagePath: 'assets/images/lugares/casa.png',
    ),
    const Pictogram(
      keyword: 'Escola',
      imagePath: 'assets/images/lugares/escola.png',
    ),
    const Pictogram(
      keyword: 'Parque',
      imagePath: 'assets/images/lugares/parque.png',
    ),
    const Pictogram(
      keyword: 'Banheiro',
      imagePath: 'assets/images/lugares/bathroom.png',
    ),
    const Pictogram(
      keyword: 'Quarto',
      imagePath: 'assets/images/lugares/quarto.png',
    ),
  ],

  'sentimentos': [
    const Pictogram(
      keyword: 'Feliz',
      imagePath: 'assets/images/sentimentos/feliz.png',
    ),
    const Pictogram(
      keyword: 'Triste',
      imagePath: 'assets/images/sentimentos/triste.png',
    ),
    const Pictogram(
      keyword: 'Bravo',
      imagePath: 'assets/images/sentimentos/bravo.png',
    ),
    const Pictogram(
      keyword: 'Com medo',
      imagePath: 'assets/images/sentimentos/medo.png',
    ),
    const Pictogram(
      keyword: 'Doente',
      imagePath: 'assets/images/sentimentos/doente.png',
    ),
  ],

  'objetos': [
    const Pictogram(
      keyword: 'Bola',
      imagePath: 'assets/images/objetos/bola.png',
    ),
    const Pictogram(
      keyword: 'Carrinho',
      imagePath: 'assets/images/objetos/carrinho.png',
    ),
    const Pictogram(
      keyword: 'Livro',
      imagePath: 'assets/images/objetos/livro.png',
    ),
    const Pictogram(
      keyword: 'Computador',
      imagePath: 'assets/images/objetos/computador.png',
    ),
    const Pictogram(
      keyword: 'Celular',
      imagePath: 'assets/images/objetos/celular.png',
    ),
    const Pictogram(
      keyword: 'Tablet',
      imagePath: 'assets/images/objetos/tablet.png',
    ),
  ],

  'rotina': [
    const Pictogram(
      keyword: 'Acordar',
      imagePath: 'assets/images/rotina/acordar.png',
    ),
    const Pictogram(
      keyword: 'Escovar os dentes',
      imagePath: 'assets/images/rotina/escovar os dentes.png',
    ),
    const Pictogram(
      keyword: 'Tomar banho',
      imagePath: 'assets/images/rotina/tomar banho.png',
    ),
    const Pictogram(
      keyword: 'Ir para a cama',
      imagePath: 'assets/images/rotina/deitar na cama.png',
    ),
  ],

  'cores': [
    const Pictogram(
      keyword: 'Vermelho',
      imagePath: 'assets/images/cores/vermelho.png',
    ),
    const Pictogram(keyword: 'Azul', imagePath: 'assets/images/cores/azul.png'),
    const Pictogram(
      keyword: 'Amarelo',
      imagePath: 'assets/images/cores/amarelo.png',
    ),
    const Pictogram(
      keyword: 'Verde',
      imagePath: 'assets/images/cores/verde.png',
    ),
    const Pictogram(
      keyword: 'Preto',
      imagePath: 'assets/images/cores/preto.png',
    ),
    const Pictogram(
      keyword: 'Branco',
      imagePath: 'assets/images/cores/branco.png',
    ),
    const Pictogram(
      keyword: 'Laranja',
      imagePath: 'assets/images/cores/laranja.png',
    ),
    const Pictogram(keyword: 'Roxo', imagePath: 'assets/images/cores/roxo.png'),
    const Pictogram(keyword: 'Rosa', imagePath: 'assets/images/cores/rosa.png'),
    const Pictogram(
      keyword: 'Marrom',
      imagePath: 'assets/images/cores/marrom.png',
    ),
  ],

  'saudacoes': [
    const Pictogram(
      keyword: 'Olá',
      imagePath: 'assets/images/saudacoes/olá.png',
    ),
    const Pictogram(
      keyword: 'Tchau',
      imagePath: 'assets/images/saudacoes/tchau.png',
    ),
    const Pictogram(
      keyword: 'Bom dia',
      imagePath: 'assets/images/saudacoes/bom dia.png',
    ),
    const Pictogram(
      keyword: 'Boa tarde',
      imagePath: 'assets/images/saudacoes/boa tarde.png',
    ),
    const Pictogram(
      keyword: 'Boa noite',
      imagePath: 'assets/images/saudacoes/boa noite.png',
    ),
  ],

  // Adicionando a nova categoria de Pronomes
  'pronomes': [
    const Pictogram(keyword: 'Eu', imagePath: 'assets/images/pronomes/eu.png'),
    const Pictogram(
      keyword: 'Alguém',
      imagePath: 'assets/images/pronomes/alguém.png',
    ),
    const Pictogram(
      keyword: 'Aquele',
      imagePath: 'assets/images/pronomes/aquele.png',
    ),
    const Pictogram(
      keyword: 'Ela',
      imagePath: 'assets/images/pronomes/ela.png',
    ),
    const Pictogram(
      keyword: 'Elas',
      imagePath: 'assets/images/pronomes/elas.png',
    ),
    const Pictogram(
      keyword: 'Ele',
      imagePath: 'assets/images/pronomes/ele.png',
    ),
    const Pictogram(
      keyword: 'Eles',
      imagePath: 'assets/images/pronomes/eles.png',
    ),
    const Pictogram(
      keyword: 'Estar',
      imagePath: 'assets/images/pronomes/estar.png',
    ),
    const Pictogram(
      keyword: 'Este',
      imagePath: 'assets/images/pronomes/este.png',
    ),
    const Pictogram(
      keyword: 'Isso',
      imagePath: 'assets/images/pronomes/isso.png',
    ),
    const Pictogram(
      keyword: 'Meu',
      imagePath: 'assets/images/pronomes/meu.png',
    ),
    const Pictogram(
      keyword: 'Nenhum',
      imagePath: 'assets/images/pronomes/nenhum.png',
    ),
    const Pictogram(
      keyword: 'Nós',
      imagePath: 'assets/images/pronomes/nós.png',
    ),
    const Pictogram(
      keyword: 'Nosso',
      imagePath: 'assets/images/pronomes/nosso.png',
    ),
    const Pictogram(
      keyword: 'Onde',
      imagePath: 'assets/images/pronomes/onde.png',
    ),
    const Pictogram(
      keyword: 'Por quê',
      imagePath: 'assets/images/pronomes/porquê.png',
    ),
    const Pictogram(
      keyword: 'Quando',
      imagePath: 'assets/images/pronomes/quando.png',
    ),
    const Pictogram(
      keyword: 'Que',
      imagePath: 'assets/images/pronomes/que.png',
    ),
    const Pictogram(
      keyword: 'Quem',
      imagePath: 'assets/images/pronomes/quem.png',
    ),
    const Pictogram(
      keyword: 'Teu',
      imagePath: 'assets/images/pronomes/teu.png',
    ),
    const Pictogram(keyword: 'Tu', imagePath: 'assets/images/pronomes/tu.png'),
    const Pictogram(
      keyword: 'Vocês',
      imagePath: 'assets/images/pronomes/vocês.png',
    ),
  ],

  // Adicionando a nova categoria de Números
  'numeros': [
    const Pictogram(keyword: 'Zero', imagePath: 'assets/images/numeros/0.png'),
    const Pictogram(keyword: 'Um', imagePath: 'assets/images/numeros/1.png'),
    const Pictogram(keyword: 'Dois', imagePath: 'assets/images/numeros/2.png'),
    const Pictogram(keyword: 'Três', imagePath: 'assets/images/numeros/3.png'),
    const Pictogram(
      keyword: 'Quatro',
      imagePath: 'assets/images/numeros/4.png',
    ),
    const Pictogram(keyword: 'Cinco', imagePath: 'assets/images/numeros/5.png'),
    const Pictogram(keyword: 'Seis', imagePath: 'assets/images/numeros/6.png'),
    const Pictogram(keyword: 'Sete', imagePath: 'assets/images/numeros/7.png'),
    const Pictogram(keyword: 'Oito', imagePath: 'assets/images/numeros/8.png'),
    const Pictogram(keyword: 'Nove', imagePath: 'assets/images/numeros/9.png'),
    const Pictogram(keyword: 'Dez', imagePath: 'assets/images/numeros/10.png'),
  ],
};
