


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// ADD TO FAVORITES (prevents duplicates)
  static Future<void> addToFavorites(String imageUrl) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final favRef = _db
        .collection("users")
        .doc(user.uid)
        .collection("favorites");

    // check if already exists
    final existing = await favRef
        .where("image", isEqualTo: imageUrl)
        .get();

    if (existing.docs.isNotEmpty) return;

    await favRef.add({
      "image": imageUrl,
      "createdAt": Timestamp.now(),
    });
  }

  /// REMOVE FROM FAVORITES (by document id)
  static Future<void> removeFromFavorites(String docId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _db
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .doc(docId)
        .delete();
  }

  /// GET DOC ID (for UI toggle like/unlike)
  static Future<String?> getFavoriteDocId(String imageUrl) async {
    final user = _auth.currentUser;
    if (user == null) return null;

    final result = await _db
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .where("image", isEqualTo: imageUrl)
        .limit(1)
        .get();

    if (result.docs.isEmpty) return null;

    return result.docs.first.id;
  }
}