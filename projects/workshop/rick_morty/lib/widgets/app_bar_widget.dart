import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty/theme/app_colors.dart';

import 'package:rick_morty/theme/app_images.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isSecondPage;

  const AppBarWidget({super.key, this.isSecondPage = false});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: const Color(0xFF1C1B1F),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      if (isSecondPage) {
                        Navigator.pop(context);
                      } else {
                        Scaffold.of(context).openDrawer();
                      }
                    },
                    child: Icon(
                      isSecondPage ? Icons.arrow_back : Icons.menu,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Column(
                  children: [
                    Image.asset(AppImages.logo, width: 115, height: 76.99),
                    Text(
                      'RICK AND MORTY API',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.5,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ImageIcon(
                  const AssetImage(AppImages.icon),
                  color: AppColors.white,
                  size: 31.46,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130.92);
}
