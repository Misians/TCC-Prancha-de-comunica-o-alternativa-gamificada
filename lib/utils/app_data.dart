import '../models/category.dart';
import '../models/pictogram.dart';

final List<Category> kCategories = [
  const Category(
    name: 'Comida',
    searchKeyword: 'comida',
    imagePath:
        'assets/images/comida/comida.png', // Exemplo: imagem para a categoria Comida
  ),
  const Category(
    name: 'Animais',
    searchKeyword: 'animais',
    imagePath:
        'assets/images/animais/gato.png', // Exemplo: imagem para a categoria Animais
  ),
  const Category(
    name: 'Ações',
    searchKeyword: 'acoes',
    imagePath:
        'assets/images/animais/gato.png', // Adicione a imagem da categoria Ações
  ),
  // Adicione mais categorias conforme a necessidade
];

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
    // Adicione mais pictogramas de comida
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
    // Adicione mais pictogramas de animais
  ],
  // Adicione as outras categorias
};
