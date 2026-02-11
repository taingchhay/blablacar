import 'package:flutter/material.dart';
import '../../../data/dummy_data.dart';
import '../../../model/ride/locations.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  List<Location> location = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
  }

  void filterLocations(String query) {
    setState(() {
      if (query.isEmpty) {
        location = [];
      } else {
        location = fakeLocations
            .where(
                (loc) => loc.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search location",
                prefixIcon: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              onChanged: filterLocations,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: location.length,
              itemBuilder: (context, index) {
                final filterLocation = location[index];
                return ListTile(
                  title: Text(filterLocation.name),
                  subtitle: Text(filterLocation.country.name),
                  onTap: () {
                    Navigator.pop(context, filterLocation);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
