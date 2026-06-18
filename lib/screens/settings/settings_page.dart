// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class SettingsPage extends StatefulWidget {
// //   const SettingsPage({super.key});
// //
// //   @override
// //   State<SettingsPage> createState() => _SettingsPageState();
// // }
// //
// // class _SettingsPageState extends State<SettingsPage> {
// //   bool darkMode = false;
// //   bool notifications = true;
// //   bool autoDownload = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final user = FirebaseAuth.instance.currentUser;
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF7F8FC),
// //
// //       appBar: AppBar(
// //         title: const Text("Settings"),
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         foregroundColor: Colors.black,
// //       ),
// //
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20),
// //         child: Column(
// //           children: [
// //
// //             //--------------------------------
// //             // USER CARD
// //             //--------------------------------
// //             Container(
// //               width: double.infinity,
// //               padding: const EdgeInsets.all(18),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(20),
// //                 gradient: const LinearGradient(
// //                   colors: [
// //                     Color(0xFF8E9EFF),
// //                     Color(0xFFC6B6FF),
// //                   ],
// //                 ),
// //               ),
// //               child: Row(
// //                 children: [
// //                   const CircleAvatar(
// //                     radius: 25,
// //                     backgroundColor: Colors.white,
// //                     child: Icon(Icons.person, color: Colors.deepPurple),
// //                   ),
// //                   const SizedBox(width: 12),
// //                   Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           user?.email ?? "Guest User",
// //                           style: const TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 4),
// //                         const Text(
// //                           "Manage your preferences",
// //                           style: TextStyle(color: Colors.white70),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //
// //             const SizedBox(height: 25),
// //
// //             //--------------------------------
// //             // SETTINGS OPTIONS
// //             //--------------------------------
// //
// //
// //             const SizedBox(height: 12),
// //
// //             _switchTile(
// //               icon: Icons.notifications,
// //               title: "Notifications",
// //               subtitle: "Receive updates",
// //               value: notifications,
// //               onChanged: (val) {
// //                 setState(() => notifications = val);
// //               },
// //             ),
// //
// //             const SizedBox(height: 12),
// //
// //             _switchTile(
// //               icon: Icons.download,
// //               title: "Auto Download",
// //               subtitle: "Save images automatically",
// //               value: autoDownload,
// //               onChanged: (val) {
// //                 setState(() => autoDownload = val);
// //               },
// //             ),
// //
// //             const SizedBox(height: 20),
// //
// //             //--------------------------------
// //             // OTHER OPTIONS
// //             //--------------------------------
// //             _tile(
// //               icon: Icons.lock_outline,
// //               title: "Privacy Policy",
// //               onTap: () {},
// //             ),
// //
// //             _tile(
// //               icon: Icons.info_outline,
// //               title: "About App",
// //               onTap: () {},
// //             ),
// //
// //             _tile(
// //               icon: Icons.delete_outline,
// //               title: "Clear Cache",
// //               onTap: () {},
// //             ),
// //
// //             const SizedBox(height: 30),
// //
// //             //--------------------------------
// //             // LOGOUT
// //             //--------------------------------
// //             SizedBox(
// //               width: double.infinity,
// //               height: 50,
// //               child: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.redAccent,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(14),
// //                   ),
// //                 ),
// //                 onPressed: () async {
// //                   await FirebaseAuth.instance.signOut();
// //
// //                   if (context.mounted) {
// //                     Navigator.pop(context);
// //                   }
// //                 },
// //                 child: const Text(
// //                   "Logout",
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   //--------------------------------
// //   // SWITCH TILE
// //   //--------------------------------
// //   Widget _switchTile({
// //     required IconData icon,
// //     required String title,
// //     required String subtitle,
// //     required bool value,
// //     required Function(bool) onChanged,
// //   }) {
// //     return Container(
// //       padding: const EdgeInsets.all(14),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(18),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.05),
// //             blurRadius: 10,
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           Icon(icon, color: Colors.deepPurple),
// //           const SizedBox(width: 12),
// //
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(title,
// //                     style: const TextStyle(
// //                         fontWeight: FontWeight.bold)),
// //                 Text(
// //                   subtitle,
// //                   style: const TextStyle(
// //                     fontSize: 12,
// //                     color: Colors.grey,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //
// //           Switch(
// //             value: value,
// //             onChanged: onChanged,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   //--------------------------------
// //   // SIMPLE TILE
// //   //--------------------------------
// //   Widget _tile({
// //     required IconData icon,
// //     required String title,
// //     required VoidCallback onTap,
// //   }) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 12),
// //       padding: const EdgeInsets.all(14),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(18),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.05),
// //             blurRadius: 10,
// //           ),
// //         ],
// //       ),
// //       child: ListTile(
// //         leading: Icon(icon, color: Colors.deepPurple),
// //         title: Text(title),
// //         trailing: const Icon(Icons.arrow_forward_ios, size: 14),
// //         onTap: onTap,
// //       ),
// //     );
// //   }
// // }
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../settings/privacy_policy_page.dart';
// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});
//
//   @override
//   State<SettingsPage> createState() =>
//       _SettingsPageState();
// }
//
// class _SettingsPageState
//     extends State<SettingsPage> {
//
//   bool notifications = true;
//   bool autoDownload = false;
//
//   void showMessage(String msg) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(
//       SnackBar(
//         content: Text(msg),
//       ),
//     );
//   }
//
//   Future<void> clearCache() async {
//
//     PaintingBinding.instance
//         .imageCache
//         .clear();
//
//     showMessage(
//       "Cache cleared successfully",
//     );
//   }
//
//   Future<void> logout() async {
//
//     final result =
//     await showDialog<bool>(
//
//       context: context,
//
//       builder: (_) {
//
//         return AlertDialog(
//
//           title: const Text(
//             "Logout",
//           ),
//
//           content: const Text(
//             "Are you sure?",
//           ),
//
//           actions: [
//
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(
//                   context,
//                   false,
//                 );
//               },
//               child: const Text(
//                 "Cancel",
//               ),
//             ),
//
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(
//                   context,
//                   true,
//                 );
//               },
//               child: const Text(
//                 "Logout",
//               ),
//             ),
//           ],
//         );
//       },
//     );
//
//     if (result != true) {
//       return;
//     }
//
//     await FirebaseAuth.instance
//         .signOut();
//
//     if (!mounted) return;
//
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final user =
//         FirebaseAuth
//             .instance
//             .currentUser;
//
//     return Scaffold(
//
//       backgroundColor:
//       const Color(0xFFF7F8FC),
//
//       appBar: AppBar(
//         title:
//         const Text("Settings"),
//
//         backgroundColor:
//         Colors.transparent,
//
//         elevation: 0,
//
//         foregroundColor:
//         Colors.black,
//       ),
//
//       body:
//       SingleChildScrollView(
//
//         padding:
//         const EdgeInsets.all(
//           20,
//         ),
//
//         child: Column(
//
//           children: [
//
//             //--------------------------------
//             // USER CARD
//             //--------------------------------
//             Container(
//
//               width:
//               double.infinity,
//
//               padding:
//               const EdgeInsets.all(
//                 18,
//               ),
//
//               decoration:
//               BoxDecoration(
//
//                 borderRadius:
//                 BorderRadius.circular(
//                   20,
//                 ),
//
//                 gradient:
//                 const LinearGradient(
//                   colors: [
//                     Color(0xFF8E9EFF),
//                     Color(0xFFC6B6FF),
//                   ],
//                 ),
//               ),
//
//               child: Row(
//
//                 children: [
//
//                   const CircleAvatar(
//                     radius: 25,
//                     backgroundColor:
//                     Colors.white,
//
//                     child: Icon(
//                       Icons.person,
//                       color:
//                       Colors.deepPurple,
//                     ),
//                   ),
//
//                   const SizedBox(
//                     width: 12,
//                   ),
//
//                   Expanded(
//                     child: Column(
//
//                       crossAxisAlignment:
//                       CrossAxisAlignment
//                           .start,
//
//                       children: [
//
//                         Text(
//
//                           user?.email ??
//                               "Guest User",
//
//                           style:
//                           const TextStyle(
//
//                             color:
//                             Colors.white,
//
//                             fontWeight:
//                             FontWeight
//                                 .bold,
//                           ),
//                         ),
//
//                         const SizedBox(
//                           height: 4,
//                         ),
//
//                         const Text(
//
//                           "Manage your preferences",
//
//                           style:
//                           TextStyle(
//                             color:
//                             Colors
//                                 .white70,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(
//               height: 25,
//             ),
//
//             //--------------------------------
//             // SWITCHES
//             //--------------------------------
//             _switchTile(
//
//               icon:
//               Icons.notifications,
//
//               title:
//               "Notifications",
//
//               subtitle:
//               "Receive updates",
//
//               value:
//               notifications,
//
//               onChanged: (val) {
//
//                 setState(() {
//                   notifications =
//                       val;
//                 });
//
//                 showMessage(
//                   val
//                       ? "Notifications enabled"
//                       : "Notifications disabled",
//                 );
//               },
//             ),
//
//             const SizedBox(
//               height: 12,
//             ),
//
//             _switchTile(
//
//               icon:
//               Icons.download,
//
//               title:
//               "Auto Download",
//
//               subtitle:
//               "Save images automatically",
//
//               value:
//               autoDownload,
//
//               onChanged: (val) {
//
//                 setState(() {
//                   autoDownload =
//                       val;
//                 });
//
//                 showMessage(
//                   val
//                       ? "Auto download enabled"
//                       : "Auto download disabled",
//                 );
//               },
//             ),
//
//             const SizedBox(
//               height: 20,
//             ),
//
//             //--------------------------------
//             // OTHER OPTIONS
//             //--------------------------------
//             _tile(
//               icon: Icons.lock_outline,
//               title: "Privacy Policy",
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => const PrivacyPolicyPage(),
//                   ),
//                 );
//               },
//             ),
//             _tile(
//
//               icon:
//               Icons.delete_outline,
//
//               title:
//               "Clear Cache",
//
//               onTap:
//               clearCache,
//             ),
//
//             const SizedBox(
//               height: 30,
//             ),
//
//             //--------------------------------
//             // LOGOUT
//             //--------------------------------
//             SizedBox(
//
//               width:
//               double.infinity,
//
//               height: 50,
//
//               child:
//               ElevatedButton(
//
//                 onPressed:
//                 logout,
//
//                 style:
//                 ElevatedButton
//                     .styleFrom(
//
//                   backgroundColor:
//                   Colors.redAccent,
//
//                   shape:
//                   RoundedRectangleBorder(
//
//                     borderRadius:
//                     BorderRadius
//                         .circular(
//                       14,
//                     ),
//                   ),
//                 ),
//
//                 child:
//                 const Text(
//
//                   "Logout",
//
//                   style:
//                   TextStyle(
//                     color:
//                     Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _switchTile({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required bool value,
//     required Function(bool) onChanged,
//   }) {
//
//     return Container(
//
//       padding:
//       const EdgeInsets.all(
//         14,
//       ),
//
//       decoration:
//       BoxDecoration(
//
//         color:
//         Colors.white,
//
//         borderRadius:
//         BorderRadius.circular(
//           18,
//         ),
//
//         boxShadow: [
//
//           BoxShadow(
//
//             color:
//             Colors.black
//                 .withOpacity(
//               0.05,
//             ),
//
//             blurRadius:
//             10,
//           ),
//         ],
//       ),
//
//       child: Row(
//
//         children: [
//
//           Icon(
//             icon,
//             color:
//             Colors.deepPurple,
//           ),
//
//           const SizedBox(
//             width: 12,
//           ),
//
//           Expanded(
//             child: Column(
//
//               crossAxisAlignment:
//               CrossAxisAlignment
//                   .start,
//
//               children: [
//
//                 Text(
//
//                   title,
//
//                   style:
//                   const TextStyle(
//                     fontWeight:
//                     FontWeight
//                         .bold,
//                   ),
//                 ),
//
//                 Text(
//
//                   subtitle,
//
//                   style:
//                   const TextStyle(
//                     fontSize: 12,
//                     color:
//                     Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Switch(
//             value: value,
//             onChanged:
//             onChanged,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _tile({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//
//     return Container(
//
//       margin:
//       const EdgeInsets.only(
//         bottom: 12,
//       ),
//
//       padding:
//       const EdgeInsets.all(
//         14,
//       ),
//
//       decoration:
//       BoxDecoration(
//
//         color:
//         Colors.white,
//
//         borderRadius:
//         BorderRadius.circular(
//           18,
//         ),
//
//         boxShadow: [
//
//           BoxShadow(
//
//             color:
//             Colors.black
//                 .withOpacity(
//               0.05,
//             ),
//
//             blurRadius:
//             10,
//           ),
//         ],
//       ),
//
//       child: ListTile(
//
//         leading: Icon(
//           icon,
//           color:
//           Colors.deepPurple,
//         ),
//
//         title:
//         Text(title),
//
//         trailing:
//         const Icon(
//           Icons
//               .arrow_forward_ios,
//
//           size: 14,
//         ),
//
//         onTap:
//         onTap,
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/theme/theme_controller.dart';
import '../../main.dart';
import '../settings/privacy_policy_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() =>
      _SettingsPageState();
}

class _SettingsPageState
    extends State<SettingsPage> {

  bool notifications = true;
  bool autoDownload = false;

  void showMessage(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  Future<void> clearCache() async {
    PaintingBinding.instance
        .imageCache
        .clear();

    showMessage(
      "Cache cleared successfully",
    );
  }

  Future<void> logout() async {

    final result =
    await showDialog<bool>(

      context: context,

      builder: (_) {
        return AlertDialog(
          title: const Text("Logout"),

          content:
          const Text(
            "Are you sure?",
          ),

          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  false,
                );
              },
              child:
              const Text(
                "Cancel",
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  true,
                );
              },
              child:
              const Text(
                "Logout",
              ),
            ),
          ],
        );
      },
    );

    if (result != true) return;

    await FirebaseAuth.instance
        .signOut();

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    final user =
        FirebaseAuth
            .instance
            .currentUser;

    final themeController =
        WallifyApp
            .themeController;

    return Scaffold(

      appBar: AppBar(
        title:
        const Text(
          "Settings",
        ),
      ),

      body:
      SingleChildScrollView(

        padding:
        const EdgeInsets.all(
          20,
        ),

        child: Column(

          children: [

            //--------------------------------
            // USER CARD
            //--------------------------------
            Container(

              width:
              double.infinity,

              padding:
              const EdgeInsets
                  .all(
                18,
              ),

              decoration:
              BoxDecoration(

                borderRadius:
                BorderRadius
                    .circular(
                  20,
                ),

                gradient:
                const LinearGradient(
                  colors: [
                    Color(
                        0xFF8E9EFF),
                    Color(
                        0xFFC6B6FF),
                  ],
                ),
              ),

              child: Row(

                children: [

                  const CircleAvatar(
                    radius: 25,
                    backgroundColor:
                    Colors
                        .white,

                    child: Icon(
                      Icons.person,
                      color: Colors
                          .deepPurple,
                    ),
                  ),

                  const SizedBox(
                    width: 12,
                  ),

                  Expanded(
                    child:
                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: [

                        Text(

                          user?.email ??
                              "Guest User",

                          style:
                          const TextStyle(

                            color:
                            Colors
                                .white,

                            fontWeight:
                            FontWeight
                                .bold,
                          ),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        const Text(
                          "Manage your preferences",

                          style:
                          TextStyle(
                            color: Colors
                                .white70,
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

            //--------------------------------
            // DARK MODE
            //--------------------------------
            AnimatedBuilder(

              animation:
              themeController,

              builder:
                  (_, __) {

                return _switchTile(

                  icon:
                  Icons.dark_mode,

                  title:
                  "Dark Mode",

                  subtitle:
                  "Switch app theme",

                  value:
                  themeController
                      .isDark,

                  onChanged:
                      (value) {

                    themeController
                        .toggleTheme();

                    showMessage(
                      value
                          ? "Dark mode enabled"
                          : "Light mode enabled",
                    );
                  },
                );
              },
            ),

            const SizedBox(
              height: 12,
            ),

            //--------------------------------
            // NOTIFICATIONS
            //--------------------------------
            _switchTile(

              icon:
              Icons.notifications,

              title:
              "Notifications",

              subtitle:
              "Receive updates",

              value:
              notifications,

              onChanged: (val) {

                setState(() {
                  notifications =
                      val;
                });

                showMessage(
                  val
                      ? "Notifications enabled"
                      : "Notifications disabled",
                );
              },
            ),

            const SizedBox(
              height: 12,
            ),

            //--------------------------------
            // TILES
            //--------------------------------
            _tile(

              icon:
              Icons.lock_outline,

              title:
              "Privacy Policy",

              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder:
                        (_) =>
                    const PrivacyPolicyPage(),
                  ),
                );
              },
            ),

            _tile(

              icon:
              Icons.delete_outline,

              title:
              "Clear Cache",

              onTap:
              clearCache,
            ),

            const SizedBox(
              height: 30,
            ),

            //--------------------------------
            // LOGOUT
            //--------------------------------
            SizedBox(

              width:
              double.infinity,

              height: 50,

              child:
              ElevatedButton(

                onPressed:
                logout,

                style:
                ElevatedButton
                    .styleFrom(

                  backgroundColor:
                  Colors
                      .redAccent,
                ),

                child:
                const Text(

                  "Logout",

                  style:
                  TextStyle(
                    color:
                    Colors
                        .white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {

    return Container(

      padding:
      const EdgeInsets.all(
        14,
      ),

      decoration:
      BoxDecoration(

        color:
        Colors.white,

        borderRadius:
        BorderRadius
            .circular(
          18,
        ),
      ),

      child: Row(

        children: [

          Icon(
            icon,
            color:
            Colors.deepPurple,
          ),

          const SizedBox(
            width: 12,
          ),

          Expanded(
            child:
            Column(

              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [

                Text(
                  title,
                ),

                Text(

                  subtitle,

                  style:
                  const TextStyle(
                    color:
                    Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: value,
            onChanged:
            onChanged,
          ),
        ],
      ),
    );
  }

  Widget _tile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {

    return Container(

      margin:
      const EdgeInsets.only(
        bottom: 12,
      ),

      decoration:
      BoxDecoration(

        color:
        Colors.white,

        borderRadius:
        BorderRadius
            .circular(
          18,
        ),
      ),

      child: ListTile(

        leading: Icon(
          icon,
          color:
          Colors.deepPurple,
        ),

        title:
        Text(title),

        trailing:
        const Icon(
          Icons
              .arrow_forward_ios,
          size: 14,
        ),

        onTap:
        onTap,
      ),
    );
  }
}