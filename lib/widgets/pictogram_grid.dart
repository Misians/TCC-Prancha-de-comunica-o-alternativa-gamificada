// lib/widgets/pictogram_grid.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/pictogram.dart';

class PictogramGrid extends StatelessWidget {
  final List<Pictogram> pictograms;
  final Function(Pictogram) onPictogramTapped;

  const PictogramGrid({
    super.key,
    required this.pictograms,
    required this.onPictogramTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: pictograms.length,
      itemBuilder: (context, index) {
        final pictogram = pictograms[index];
        return GestureDetector(
          onTap: () => onPictogramTapped(pictogram),
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
                    style: const TextStyle(fontSize: 24),
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
