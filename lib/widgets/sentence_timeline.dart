// lib/widgets/sentence_timeline.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/pictogram.dart';

class SentenceTimeline extends StatelessWidget {
  final List<Pictogram> selectedPictograms;
  final VoidCallback onRemoveLast;
  final VoidCallback onSpeak;

  const SentenceTimeline({
    super.key,
    required this.selectedPictograms,
    required this.onRemoveLast,
    required this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Aumenta a altura para acomodar o texto
      color: Colors.grey.shade200, // Fundo mais claro
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: selectedPictograms.isEmpty
          ? const Center(
              child: Text(
                'Nenhum pictograma selecionado.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedPictograms.length,
                    itemBuilder: (context, index) {
                      final pictogram = selectedPictograms[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ), // Bordas arredondadas
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1), // Sombra sutil
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                pictogram.imagePath,
                                width: 60,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width:
                                  68, // Largura fixa para evitar quebras de linha indesejadas
                              child: Text(
                                pictogram.keyword,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.backspace,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: onRemoveLast,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: onSpeak,
                ),
              ],
            ),
    );
  }
}
