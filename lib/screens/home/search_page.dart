import 'package:flutter/material.dart';
import '../../services/wallpaper_api_service.dart';
import '../../widgets/wallpaper_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> wallpapers = [];
  bool isLoading = false;

  Future<void> searchWallpapers(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      final data = await WallpaperApiService.searchWallpapers(query);

      setState(() {
        wallpapers = data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      debugPrint("Search error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Wallpapers"),
      ),

      body: Column(
        children: [
          // 🔍 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onSubmitted: (value) {
                searchWallpapers(value);
              },
              decoration: InputDecoration(
                hintText: "Search (cars, nature, aesthetic...)",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // RESULTS
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : wallpapers.isEmpty
                ? const Center(
              child: Text("Search wallpapers to get results"),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: wallpapers.length,
              itemBuilder: (context, index) {
                return WallpaperCard(
                  imageUrl: wallpapers[index]["src"]["portrait"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}