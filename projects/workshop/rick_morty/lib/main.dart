import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_morty/pages/episodes_page.dart';
import 'package:rick_morty/pages/locations_page.dart';
import 'package:rick_morty/pages/statistics_page.dart';
import 'package:rick_morty/theme/app_colors.dart';

import 'pages/home_page.dart';
import 'pages/details_page.dart';

void main() {
  runApp(const RickMortyApp());
}

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColorDark,
        ),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: CharacterHomePage.routeId,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CharacterHomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const CharacterHomePage(),
            );

          case DetailsPage.routeId:
            final characterId = settings.arguments as int;

            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsPage(characterId: characterId),
            );

          case LocationsHomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const LocationsHomePage(),
            );

          case EpisodesHomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const EpisodesHomePage(),
            );

          case StatisticsPage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const StatisticsPage(),
            );

          default:
            return null;
        }
      },
    );
  }
}
