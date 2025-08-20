// lib/screens/history_screen.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/user.dart';

class HistoryScreen extends StatelessWidget {
  final User user;

  const HistoryScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Frases')),
      body: user.history.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma frase salva ainda.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: user.history.length,
              itemBuilder: (context, index) {
                final sentence = user.history[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      sentence.sentenceText,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Pontos: ${sentence.scoreEarned} • ${sentence.timestamp.day}/${sentence.timestamp.month}/${sentence.timestamp.year}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    leading: Wrap(
                      spacing: 4,
                      children: sentence.pictograms
                          .map((p) => Image.asset(p.imagePath, width: 40))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
