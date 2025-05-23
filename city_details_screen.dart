import 'package:flutter/material.dart';
import '../models/city.dart';

class CityDetailsScreen extends StatelessWidget {
  final City city;

  const CityDetailsScreen({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(city.name), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // City image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                city.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.broken_image, size: 48)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // City state and time
            Text("State: ${city.state}", style: const TextStyle(fontSize: 16)),
            Text("Best Time to Visit: ${city.bestTimeToVisit}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            // Popular Places
            Text("Popular Places:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal.shade700)),
            const SizedBox(height: 6),
            ...city.popularPlaces.map((place) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text("- $place", style: const TextStyle(fontSize: 16)),
            )),

            const SizedBox(height: 20),

            // Popular Restaurants
            Text("Popular Restaurants:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal.shade700)),
            const SizedBox(height: 6),
            ...city.popularRestaurants.map((restaurant) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text("- $restaurant", style: const TextStyle(fontSize: 16)),
            )),
          ],
        ),
      ),
    );
  }
}
