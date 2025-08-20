// lib/home_screen.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/category.dart';
import 'package:roboldo/models/pictogram.dart';
import 'package:roboldo/screens/login_screen.dart';
import 'package:roboldo/utils/app_data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:uuid/uuid.dart';

import 'package:roboldo/models/user.dart';
import 'package:roboldo/services/user_service.dart';
import 'package:roboldo/models/sentence_history.dart';
import 'package:roboldo/screens/history_screen.dart';

// Importa os novos widgets
import 'package:roboldo/widgets/score_bar.dart';
import 'package:roboldo/widgets/sentence_timeline.dart';
import 'package:roboldo/widgets/category_grid.dart';
import 'package:roboldo/widgets/pictogram_grid.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterTts flutterTts = FlutterTts();
  late User _currentUser;
  final _uuid = const Uuid();

  bool _isViewingCategories = true;
  List<Pictogram> _currentPictograms = [];
  String _currentCategoryName = '';
  final List<Pictogram> _selectedPictograms = [];

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
    _setTtsLanguage();
  }

  Future<void> _setTtsLanguage() async {
    await flutterTts.setLanguage("pt-BR");
  }

  Future<void> _speak() async {
    final text = _selectedPictograms.map((p) => p.keyword).join(' ');
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
      _onSentenceCompleted(text);
    }
  }

  void _onSentenceCompleted(String sentenceText) {
    if (sentenceText.isEmpty) return;

    int points = sentenceText.length > 20 ? 20 : 10;
    int experience = 100;

    final newHistory = SentenceHistory(
      id: _uuid.v4(),
      userId: _currentUser.id,
      timestamp: DateTime.now(),
      pictograms: List.from(_selectedPictograms),
      sentenceText: sentenceText,
      scoreEarned: points,
    );

    setState(() {
      _currentUser.addScore(points);
      _currentUser.addExperience(experience);
      _currentUser.history.add(newHistory);
      _selectedPictograms.clear();
    });

    UserService.saveUser(_currentUser);
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

  void _showSettingsModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Configurações do Sistema',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair (Logout)'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
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
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HistoryScreen(user: _currentUser),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettingsModal,
          ),
        ],
      ),
      body: Column(
        children: [
          ScoreBar(user: _currentUser),
          SentenceTimeline(
            selectedPictograms: _selectedPictograms,
            onRemoveLast: _onRemoveLastPictogram,
            onSpeak: _speak,
          ),
          Expanded(
            child: _isViewingCategories
                ? CategoryGrid(
                    categories: kCategories,
                    onCategoryTapped: _onCategoryTapped,
                  )
                : PictogramGrid(
                    pictograms: _currentPictograms,
                    onPictogramTapped: _onPictogramTapped,
                  ),
          ),
        ],
      ),
    );
  }
}
