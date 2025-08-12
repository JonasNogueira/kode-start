import 'package:flutter/material.dart';

import 'package:rick_morty/models/location_model.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/search_bar_widget.dart';
import 'package:rick_morty/widgets/drawer_widget.dart';
import 'package:rick_morty/widgets/location_list_widget.dart';
import 'package:rick_morty/repositories/location_repository.dart';
import 'package:rick_morty/theme/app_colors.dart';

class LocationsHomePage extends StatefulWidget {
  static const routeId = '/locations';

  const LocationsHomePage({super.key});

  @override
  State<LocationsHomePage> createState() => _LocationsHomePageState();
}

class _LocationsHomePageState extends State<LocationsHomePage> {
  Future<List<DetailedLocation>>? locations;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  void _fetchLocations([String name = '']) {
    setState(() {
      locations = LocationRepository.getAllLocations(
        name: name.isNotEmpty ? name.toLowerCase() : null,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchLocations();
    _searchController.addListener(() => setState(() {}));

    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showScrollToTopButton) {
        setState(() => _showScrollToTopButton = true);
      } else if (_scrollController.offset <= 300 && _showScrollToTopButton) {
        setState(() => _showScrollToTopButton = false);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: AppColors.backgroundColor,
      drawer: const CustomDrawerWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarWidget(
              controller: _searchController,
              onChanged: (value) => _fetchLocations(value),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<DetailedLocation>>(
              future: locations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return LocationListWidget(
                    locations: snapshot.data!,
                    scrollController: _scrollController,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "No locations found.",
                      style: TextStyle(color: AppColors.white),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColors.primaryColorLight.withAlpha(180),
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
