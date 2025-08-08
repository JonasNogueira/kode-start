import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hint;

  const SearchBarWidget({super.key, this.hint = 'Search Characters'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        hintText: hint,
        leading: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 72, 137, 167),
        ),
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
