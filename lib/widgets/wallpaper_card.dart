import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

import '../screens/auth/login_page.dart';
import '../screens/home/wallpaper_view_page.dart';
import '../services/firestore_service.dart';

class WallpaperCard extends StatelessWidget {
  final String imageUrl;

  const WallpaperCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (imageUrl.isEmpty) return;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WallpaperViewPage(
              imageUrl: imageUrl,
            ),
          ),
        );
      },

      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[900],
        ),

        child: Stack(
          fit: StackFit.expand,
          children: [

            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white,
                  ),
                );
              },
            ),

            // ❤️ FAVORITE BUTTON (TOGGLE)
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;

                  if (user == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                    );
                    return;
                  }

                  try {
                    final docId =
                    await FirestoreService.getFavoriteDocId(imageUrl);

                    if (docId == null) {
                      await FirestoreService.addToFavorites(imageUrl);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to favorites ❤️"),
                        ),
                      );
                    } else {
                      await FirestoreService.removeFromFavorites(docId);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Removed from favorites 💔"),
                        ),
                      );
                    }
                  } catch (e) {
                    debugPrint("Favorite error: $e");
                  }
                },
              ),
            ),

            // ⬇ DOWNLOAD BUTTON
            Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;

                  if (user == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                    );
                    return;
                  }

                  try {
                    final response =
                    await http.get(Uri.parse(imageUrl));

                    if (response.statusCode != 200) return;

                    final blob = html.Blob([response.bodyBytes]);
                    final url =
                    html.Url.createObjectUrlFromBlob(blob);

                    final anchor = html.AnchorElement(href: url)
                      ..setAttribute("download", "wallify.jpg")
                      ..click();

                    html.Url.revokeObjectUrl(url);
                  } catch (e) {
                    debugPrint("Download error: $e");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}