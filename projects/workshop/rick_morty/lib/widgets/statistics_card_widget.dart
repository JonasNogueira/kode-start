import 'package:flutter/material.dart';
import 'package:rick_morty/theme/app_colors.dart';

class StatisticsCard extends StatelessWidget {
  final String title;
  final Map<String, int> items;

  const StatisticsCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.7;

    return Center(
      child: SizedBox(
        width: cardWidth,
        child: Card(
          color: AppColors.primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                ...items.entries.map(
                  (e) => Text(
                    '${e.key}: ${e.value}',
                    style: TextStyle(
                      color: AppColors.white.withValues(alpha: 0.8),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
