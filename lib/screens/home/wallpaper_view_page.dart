import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WallpaperViewPage extends StatelessWidget {
  final String imageUrl;
  final String? docId; // optional for favorites

  const WallpaperViewPage({
    super.key,
    required this.imageUrl,
    this.docId,
  });

  Future<void> removeFavorite(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || docId == null) return;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .doc(docId)
        .delete();

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Removed from favorites 💔")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SizedBox.expand(
        child: Stack(
          children: [

            // IMAGE
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.network(imageUrl),
              ),
            ),

            // TOP BAR
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),

                    Row(
                      children: [

                        // ❤️ REMOVE FROM FAVORITES (ONLY IF FROM FAVORITES PAGE)
                        if (docId != null)
                          IconButton(
                            onPressed: () => removeFavorite(context),
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}