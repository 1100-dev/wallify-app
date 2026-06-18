import 'package:flutter/material.dart';

import '../screens/favorites/favorites_page.dart';

class QuickFabMenu {
  static void show(BuildContext context, List<String> categories,
      Function(String) onCategorySelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Quick Access",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Divider(),

              const SizedBox(height: 10),

              // Categories Grid
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((cat) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      onCategorySelected(cat);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Quick Actions Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Trending
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      onCategorySelected("All");
                    },
                    icon: const Icon(Icons.trending_up),
                    label: const Text("Trending"),
                  ),

                  // Favorites
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FavoritesPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Text("Favorites"),
                  ),
                ],
              ),

              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}