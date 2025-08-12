import 'package:flutter/material.dart';
import 'package:rick_morty/widgets/app_bar_widget.dart';
import 'package:rick_morty/widgets/search_bar_widget.dart';
import 'package:rick_morty/widgets/drawer_widget.dart';
import 'package:rick_morty/widgets/location_list_widget.dart';
import 'package:rick_morty/repositories/location_repository.dart';
import 'package:rick_morty/models/paginated_locations_model.dart';
import 'package:rick_morty/theme/app_colors.dart';

class LocationsHomePage extends StatefulWidget {
  static const routeId = '/locations';

  const LocationsHomePage({super.key});

  @override
  State<LocationsHomePage> createState() => _LocationsHomePageState();
}

class _LocationsHomePageState extends State<LocationsHomePage> {
  Future<PaginatedLocations>? locations;
  final TextEditingController _searchController = TextEditingController();

  void _fetchLocations([String name = '']) {
    setState(() {
      locations = LocationRepository.getLocations(name: name);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchLocations();
    _searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            child: FutureBuilder<PaginatedLocations>(
              future: locations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return LocationListWidget(locations: snapshot.data!.results);
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
    );
  }
}
