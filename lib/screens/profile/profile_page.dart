// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../auth/login_page.dart';
// import '../favorites/favorites_page.dart';
//
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//   Stream<int> favoriteCount() {
//     final user = FirebaseAuth.instance.currentUser;
//     final name = user?.email ?? "Guest";
//
//     final initial =
//     name.isNotEmpty
//         ? name[0].toUpperCase()
//         : "G";
//
//
//     final hour =
//         DateTime.now().hour;
//
//     final greeting =
//     hour < 12
//         ? "Good Morning ☀️"
//         : hour < 17
//         ? "Good Afternoon 🌤️"
//         : "Good Evening 🌙";
//     if (user == null) {
//       return Stream.value(0);
//     }
//
//     return FirebaseFirestore.instance
//         .collection("users")
//         .doc(user.uid)
//         .collection("favorites")
//         .snapshots()
//         .map(
//           (snapshot) => snapshot.docs.length,
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final joinDate =
//         user?.metadata.creationTime
//             ?.toString()
//             .split(" ")
//             .first ??
//             "Unknown";
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7F8FC),
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               //--------------------------------
//               // HEADER
//               //--------------------------------
//               Container(
//                 padding: const EdgeInsets.all(20),
//
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color(0xFF8E9EFF),
//                       Color(0xFFC6B6FF),
//                     ],
//                   ),
//                 ),
//
//                 child: Row(
//                   children: [
//
//                     Container(
//                       height: 75,
//                       width: 75,
//
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white.withOpacity(0.25),
//                       ),
//
//                       child: const Icon(
//                         Icons.person,
//                         color: Colors.white,
//                         size: 38,
//                       ),
//                     ),
//
//                     const SizedBox(width: 15),
//
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment:
//                         CrossAxisAlignment.start,
//
//                         children: [
//
//                           Text(
//                             user?.email ?? "Guest User",
//
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           const SizedBox(height: 6),
//
//                           const Text(
//                             "Wallpaper Explorer ✨",
//
//                             style: TextStyle(
//                               color: Colors.white70,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               //--------------------------------
//               // STATS
//               //--------------------------------
//               StreamBuilder<int>(
//                 stream: favoriteCount(),
//
//                 builder: (context, snapshot) {
//
//                   final favorites =
//                       snapshot.data ?? 0;
//
//                   return Row(
//                     children: [
//
//                       Expanded(
//                         child: _StatCard(
//                           title: "Favorites",
//                           value: favorites.toString(),
//                           icon: Icons.favorite,
//                         ),
//                       ),
//
//                       const SizedBox(width: 12),
//
//                       Expanded(
//                         child: _StatCard(
//                           title: "Joined",
//                           value: joinDate,
//                           icon: Icons.calendar_today,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//
//               //--------------------------------
//               // ACCOUNT
//               //--------------------------------
//               const Text(
//                 "Account",
//
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               _menuTile(
//                 context,
//                 icon: Icons.favorite,
//                 title: "Favorites",
//                 subtitle: "Saved wallpapers",
//
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) =>
//                       const FavoritesPage(),
//                     ),
//                   );
//                 },
//               ),
//
//               const SizedBox(height: 12),
//
//               _menuTile(
//                 context,
//                 icon: Icons.dark_mode,
//                 title: "Theme",
//                 subtitle: "Light / Dark mode",
//                 onTap: () {},
//               ),
//
//               const SizedBox(height: 12),
//
//               _menuTile(
//                 context,
//                 icon: Icons.notifications,
//                 title: "Notifications",
//                 subtitle: "Manage alerts",
//                 onTap: () {},
//               ),
//
//               const SizedBox(height: 12),
//
//               _menuTile(
//                 context,
//                 icon: Icons.info_outline,
//                 title: "About App",
//                 subtitle: "Version & details",
//                 onTap: () {},
//               ),
//
//               const SizedBox(height: 30),
//
//               //--------------------------------
//               // RECENT ACTIVITY
//               //--------------------------------
//               const Text(
//                 "Recent Activity",
//
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               Container(
//                 padding: const EdgeInsets.all(18),
//
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.12),
//                       blurRadius: 12,
//                     ),
//                   ],
//                 ),
//
//                 child: const Row(
//                   children: [
//
//                     Icon(
//                       Icons.history,
//                       color: Colors.deepPurple,
//                     ),
//
//                     SizedBox(width: 12),
//
//                     Expanded(
//                       child: Text(
//                         "You downloaded 3 wallpapers today ✨",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 35),
//
//               //--------------------------------
//               // LOGOUT
//               //--------------------------------
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//
//                 child: ElevatedButton(
//                   onPressed: () async {
//
//                     await FirebaseAuth.instance
//                         .signOut();
//
//                     if (context.mounted) {
//
//                       Navigator.pushAndRemoveUntil(
//                         context,
//
//                         MaterialPageRoute(
//                           builder: (_) =>
//                           const LoginPage(),
//                         ),
//
//                             (route) => false,
//                       );
//                     }
//                   },
//
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                     const Color(0xFF8E9EFF),
//
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                       BorderRadius.circular(18),
//                     ),
//                   ),
//
//                   child: const Text(
//                     "Logout",
//
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _menuTile(
//       BuildContext context, {
//         required IconData icon,
//         required String title,
//         required String subtitle,
//         required VoidCallback onTap,
//       }) {
//     return GestureDetector(
//       onTap: onTap,
//
//       child: Container(
//         padding: const EdgeInsets.all(18),
//
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.12),
//               blurRadius: 10,
//             ),
//           ],
//         ),
//
//         child: Row(
//           children: [
//
//             Icon(
//               icon,
//               color: Colors.deepPurple,
//             ),
//
//             const SizedBox(width: 15),
//
//             Expanded(
//               child: Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//
//                 children: [
//
//                   Text(
//                     title,
//
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   Text(
//                     subtitle,
//
//                     style: const TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const Icon(
//               Icons.arrow_forward_ios,
//               size: 16,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;
//
//   const _StatCard({
//     required this.title,
//     required this.value,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.12),
//             blurRadius: 10,
//           ),
//         ],
//       ),
//
//       child: Column(
//         children: [
//
//           Icon(
//             icon,
//             color: Colors.deepPurple,
//           ),
//
//           const SizedBox(height: 8),
//
//           Text(
//             value,
//
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//
//           Text(
//             title,
//
//             style: const TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth/login_page.dart';
import '../favorites/favorites_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // REAL FAVORITES COUNT
  Stream<int> favoriteCount() {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Stream.value(0);
    }

    return FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection("favorites")
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.length,
    );
  }

  @override
  Widget build(BuildContext context) {

    final user =
        FirebaseAuth.instance.currentUser;

    final name =
        user?.email ?? "Guest";

    final initial =
    name.isNotEmpty
        ? name[0].toUpperCase()
        : "G";

    final joinDate =
        user?.metadata.creationTime
            ?.toString()
            .split(" ")
            .first ??
            "Unknown";

    final lastLogin =
        user?.metadata.lastSignInTime
            ?.toString()
            .split(" ")
            .first ??
            "Unknown";

    final hour =
        DateTime.now().hour;

    final greeting =
    hour < 12
        ? "Good Morning ☀️"
        : hour < 17
        ? "Good Afternoon 🌤️"
        : "Good Evening 🌙";

    return Scaffold(
      backgroundColor:
      const Color(0xFFF7F8FC),

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // HEADER
              Container(
                padding:
                const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(30),

                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xFF8E9EFF),
                      Color(0xFFC6B6FF),
                    ],
                  ),
                ),

                child: Row(
                  children: [

                    // INITIALS AVATAR
                    Container(
                      height: 75,
                      width: 75,

                      decoration:
                      BoxDecoration(
                        shape:
                        BoxShape.circle,

                        color: Colors.white
                            .withOpacity(0.25),
                      ),

                      child: Center(
                        child: Text(
                          initial,

                          style:
                          const TextStyle(
                            color:
                            Colors.white,

                            fontSize: 30,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 15,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            greeting,

                            style:
                            const TextStyle(
                              color:
                              Colors.white70,
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          Text(
                            user?.email ??
                                "Guest User",

                            style:
                            const TextStyle(
                              color:
                              Colors.white,

                              fontSize: 16,

                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              // REAL STATS
              StreamBuilder<int>(
                stream:
                favoriteCount(),

                builder:
                    (context, snapshot) {

                  final favorites =
                      snapshot.data ?? 0;

                  return Row(
                    children: [

                      Expanded(
                        child: _StatCard(
                          title:
                          "Favorites",

                          value:
                          favorites.toString(),

                          icon:
                          Icons.favorite,
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      Expanded(
                        child: _StatCard(
                          title:
                          "Joined",

                          value:
                          joinDate,

                          icon:
                          Icons.calendar_today,
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(
                height: 30,
              ),

              // ACCOUNT
              const Text(
                "Account",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              _menuTile(
                context,

                icon:
                Icons.favorite,

                title:
                "Favorites",

                subtitle:
                "Saved wallpapers",

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const FavoritesPage(),
                    ),
                  );
                },
              ),

              const SizedBox(
                height: 12,
              ),

              _menuTile(
                context,

                icon:
                Icons.info_outline,

                title:
                "Last Login",

                subtitle:
                lastLogin,

                onTap: () {},
              ),

              const SizedBox(
                height: 35,
              ),

              // LOGOUT
              SizedBox(
                width:
                double.infinity,

                height: 55,

                child: ElevatedButton(
                  onPressed:
                      () async {

                    await FirebaseAuth
                        .instance
                        .signOut();

                    if (context.mounted) {

                      Navigator
                          .pushAndRemoveUntil(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                          const LoginPage(),
                        ),

                            (route) =>
                        false,
                      );
                    }
                  },

                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(
                        0xFF8E9EFF),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          18),
                    ),
                  ),

                  child:
                  const Text(
                    "Logout",

                    style:
                    TextStyle(
                      color:
                      Colors.white,

                      fontSize:
                      16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding:
        const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.12),

              blurRadius: 10,
            ),
          ],
        ),

        child: Row(
          children: [

            Icon(
              icon,
              color:
              Colors.deepPurple,
            ),

            const SizedBox(
              width: 15,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [

                  Text(
                    title,

                    style:
                    const TextStyle(
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  Text(
                    subtitle,

                    style:
                    const TextStyle(
                      color:
                      Colors.grey,

                      fontSize:
                      12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding:
      const EdgeInsets.all(14),

      decoration:
      BoxDecoration(
        color:
        Colors.white,

        borderRadius:
        BorderRadius.circular(
            20),

        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(0.12),

            blurRadius: 10,
          ),
        ],
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color:
            Colors.deepPurple,
          ),

          const SizedBox(
            height: 8,
          ),

          Text(
            value,

            style:
            const TextStyle(
              fontWeight:
              FontWeight.bold,

              fontSize: 16,
            ),
          ),

          Text(
            title,

            style:
            const TextStyle(
              color:
              Colors.grey,

              fontSize:
              12,
            ),
          ),
        ],
      ),
    );
  }
}