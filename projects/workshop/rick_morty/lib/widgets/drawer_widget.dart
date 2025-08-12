import 'package:flutter/material.dart';
import 'package:rick_morty/pages/episodes_page.dart';
import 'package:rick_morty/pages/home_page.dart';
import 'package:rick_morty/pages/locations_page.dart';
import 'package:rick_morty/pages/statistics_page.dart';
import 'package:rick_morty/theme/app_colors.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: AppColors.appBarColor),
            accountName: Text(
              "Kobe Apps",
              style: TextStyle(color: AppColors.white),
            ),
            accountEmail: Text(
              "kobeapps@example.com",
              style: TextStyle(color: AppColors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.white,
              child: Icon(Icons.person, size: 40, color: Colors.black),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.group,
            text: "Characters",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CharacterHomePage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.tv,
            text: "Episodes",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EpisodesHomePage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.place,
            text: "Locations",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LocationsHomePage()),
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.bar_chart,
            text: "Statistics",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StatisticsPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.white),
      title: Text(text, style: TextStyle(color: AppColors.white)),
      onTap: onTap,
    );
  }
}
