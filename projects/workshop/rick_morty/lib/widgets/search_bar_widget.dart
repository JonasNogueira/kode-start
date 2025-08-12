import 'package:flutter/material.dart';

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
        leading: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 72, 137, 167),
        ),
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
          const Color.fromARGB(22, 255, 255, 255),
        ),
        hintStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 13,
            color: Color.fromARGB(45, 255, 255, 255),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
