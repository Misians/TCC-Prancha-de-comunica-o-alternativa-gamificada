// Em lib/home_screen.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/category.dart';
import 'package:roboldo/models/pictogram.dart';
import 'package:roboldo/utils/app_data.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Importe o pacote

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Inicialize o objeto TTS
  final FlutterTts flutterTts = FlutterTts();

  bool _isViewingCategories = true;
  List<Pictogram> _currentPictograms = [];
  String _currentCategoryName = '';
  List<Pictogram> _selectedPictograms = [];

  @override
  void initState() {
    super.initState();
    _setTtsLanguage();
  }

  Future<void> _setTtsLanguage() async {
    await flutterTts.setLanguage("pt-BR");
    // Você pode adicionar outras configurações aqui, como velocidade (rate)
    // await flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speak() async {
    final text = _selectedPictograms.map((p) => p.keyword).join(' ');
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  void _onCategoryTapped(Category category) {
    setState(() {
      _isViewingCategories = false;
      _currentCategoryName = category.name;
      _currentPictograms = kPictogramsByCategory[category.searchKeyword] ?? [];
    });
  }

  void _onPictogramTapped(Pictogram pictogram) {
    setState(() {
      _selectedPictograms.add(pictogram);
    });
  }

  void _onRemoveLastPictogram() {
    setState(() {
      if (_selectedPictograms.isNotEmpty) {
        _selectedPictograms.removeLast();
      }
    });
  }

  void _onBackPressed() {
    setState(() {
      _isViewingCategories = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isViewingCategories ? 'Categorias' : _currentCategoryName),
        leading: _isViewingCategories
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _onBackPressed,
              ),
      ),
      body: Column(
        children: [
          _buildTimeline(),
          Expanded(
            child: _isViewingCategories
                ? _buildCategoryGrid()
                : _buildPictogramGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      height: 100,
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: _selectedPictograms.isEmpty
          ? const Center(
              child: Text(
                'Nenhum pictograma selecionado.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(137, 208, 244, 255),
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedPictograms.length,
                    itemBuilder: (context, index) {
                      final pictogram = _selectedPictograms[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(pictogram.imagePath, width: 70),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.backspace, size: 30),
                  onPressed: _onRemoveLastPictogram,
                ),
                const SizedBox(width: 8), // Espaçamento entre os botões
                IconButton(
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 30,
                    color: Colors.green,
                  ),
                  onPressed: _speak, // Chama a função para falar
                ),
              ],
            ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: kCategories.length,
      itemBuilder: (context, index) {
        final category = kCategories[index];
        return GestureDetector(
          onTap: () => _onCategoryTapped(category),
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(category.imagePath, fit: BoxFit.cover),
                ),
                const SizedBox(height: 8),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPictogramGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: _currentPictograms.length,
      itemBuilder: (context, index) {
        final pictogram = _currentPictograms[index];
        return GestureDetector(
          // Adicionado GestureDetector para capturar o toque
          onTap: () => _onPictogramTapped(pictogram),
          child: Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(pictogram.imagePath, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    pictogram.keyword,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
