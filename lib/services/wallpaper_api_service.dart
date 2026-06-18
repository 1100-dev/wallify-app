import 'dart:convert';
import 'package:http/http.dart' as http;

class WallpaperApiService {

  static const String apiKey = "iAoIIqhVdOyERoWJih3W4ynZoPQShMwLDZRZWZhA0V9TdjJPEYRpyoET";

  static Future<List<dynamic>> getTrendingWallpapers() async {

    final response = await http.get(
      Uri.parse(
        "https://api.pexels.com/v1/curated?per_page=40",
      ),
      headers: {
        "Authorization": apiKey,
      },
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return data["photos"];

    } else {

      throw Exception("Failed to load wallpapers");

    }
  }


  static Future<List<dynamic>> searchWallpapers(
      String query,
      ) async {

    final response = await http.get(
      Uri.parse(
        "https://api.pexels.com/v1/search?query=$query&per_page=40",
      ),
      headers: {
        "Authorization": apiKey,
      },
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      return data["photos"];

    } else {

      throw Exception("Search failed");

    }
  }
}