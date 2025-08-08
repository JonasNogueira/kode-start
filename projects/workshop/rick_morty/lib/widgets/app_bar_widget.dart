import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C1B1F),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.menu, color: Colors.white, size: 25),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 115,
                    height: 76.98668670654297,
                  ),
                  Text(
                    'RICK AND MORTY API',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 31.46,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(130.92);
}
