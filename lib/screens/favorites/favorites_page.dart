// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class FavoritesPage extends StatelessWidget {
//   const FavoritesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//
//     if (user == null) {
//       return const Scaffold(
//         body: Center(
//           child: Text("Please login to view favorites"),
//         ),
//       );
//     }
//
//     final stream = FirebaseFirestore.instance
//         .collection("users")
//         .doc(user.uid)
//         .collection("favorites")
//         .orderBy("createdAt", descending: true)
//         .snapshots();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favorites ❤️"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: stream,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(
//               child: Text("No favorites yet"),
//             );
//           }
//
//           final docs = snapshot.data!.docs;
//
//           return GridView.builder(
//             padding: const EdgeInsets.all(10),
//             itemCount: docs.length,
//             gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.7,
//             ),
//             itemBuilder: (context, index) {
//               final data =
//               docs[index].data() as Map<String, dynamic>;
//
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: Image.network(
//                   data["image"],
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/wallpaper_view_page.dart';
import '../../services/firestore_service.dart';
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const Scaffold(
        body: Center(
          child: Text("Please login to view favorites"),
        ),
      );
    }

    final stream = FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .orderBy("createdAt", descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites ❤️"),
        automaticallyImplyLeading: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text("No favorites yet"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final imageUrl = data["image"];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WallpaperViewPage(
                        imageUrl: imageUrl,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    // IMAGE
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // REMOVE HEART BUTTON
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () async {
                          await FirestoreService.removeFromFavorites(doc.id);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Removed from favorites"),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}