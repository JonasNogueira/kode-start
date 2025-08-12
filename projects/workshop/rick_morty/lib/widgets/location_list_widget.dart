import 'package:flutter/material.dart';
import 'package:rick_morty/models/location_model.dart';
import 'package:rick_morty/widgets/location_card_widget.dart';

class LocationListWidget extends StatelessWidget {
  final List<DetailedLocation> locations;

  const LocationListWidget({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3 / 2,
      ),
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return LocationCardWidget(location: location, onTap: () {});
      },
    );
  }
}
