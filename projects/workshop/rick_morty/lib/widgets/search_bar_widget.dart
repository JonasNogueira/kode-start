import 'package:flutter/material.dart';
import 'package:rick_morty/theme/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    this.hint = 'search',
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        controller: controller,
        hintText: hint,
        leading: Icon(Icons.search, color: AppColors.blue),
        trailing: [
          if (controller.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                controller.clear();
                onChanged('');
              },
            ),
        ],
        onChanged: onChanged,
        backgroundColor: WidgetStateProperty.all(
          AppColors.white.withValues(alpha: 0.1),
        ),
        hintStyle: WidgetStateProperty.all(
          TextStyle(
            fontSize: 13,
            color: AppColors.white.withValues(alpha: 0.3),
          ),
        ),
        textStyle: WidgetStateProperty.all(TextStyle(color: AppColors.white)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
