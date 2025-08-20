// lib/widgets/score_bar.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/user.dart';

class ScoreBar extends StatelessWidget {
  final User user;

  const ScoreBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final double progress = (user.experience / (user.level * 1000)).clamp(
      0.0,
      1.0,
    );
    return Container(
      color: const Color.fromARGB(0, 149, 43, 255),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Seção de pontuação
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pontuação',
                style: TextStyle(
                  color: Color.fromARGB(179, 56, 19, 72),
                  fontSize: 16,
                ),
              ),
              Text(
                '${user.score}',
                style: const TextStyle(
                  color: Color.fromARGB(179, 56, 19, 72),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [],
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Seção de nível e barra de experiência
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Nível ${user.level}',
                  style: const TextStyle(
                    color: Color.fromARGB(179, 56, 19, 72),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Barra de progresso com visual personalizado
                Stack(
                  children: [
                    // Fundo da barra
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 234, 234),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white24, width: 1),
                      ),
                    ),
                    // Progresso da barra
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 20,
                        backgroundColor: Colors.transparent,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 136, 57, 255),
                        ),
                      ),
                    ),
                    // Texto sobre a barra
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          '${(user.experience)} / ${user.level * 1000} XP',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
