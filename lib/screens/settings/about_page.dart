import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      appBar: AppBar(
        title: const Text("About App"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            //--------------------------------
            // APP HEADER CARD
            //--------------------------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF8E9EFF),
                    Color(0xFFC6B6FF),
                  ],
                ),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.wallpaper,
                    size: 50,
                    color: Colors.white,
                  ),

                  SizedBox(width: 15),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Wallify",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Beautiful Wallpapers App",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //--------------------------------
            // DESCRIPTION
            //--------------------------------
            _card(
              title: "About",
              icon: Icons.info_outline,
              child: const Text(
                "Wallify is a modern wallpaper app built using Flutter. "
                    "It allows users to explore high-quality wallpapers, "
                    "save favorites, and download images instantly.",
              ),
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // FEATURES
            //--------------------------------
            _card(
              title: "Features",
              icon: Icons.star_border,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("• HD Wallpapers Collection"),
                  Text("• Categories (Nature, Anime, Cars, etc.)"),
                  Text("• Favorites System"),
                  Text("• Fast Image Loading"),
                  Text("• Download Support"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // TECH STACK
            //--------------------------------
            _card(
              title: "Built With",
              icon: Icons.code,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("• Flutter (Frontend)"),
                  Text("• Firebase Auth"),
                  Text("• Cloud Firestore"),
                  Text("• Pexels API"),
                ],
              ),
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // VERSION
            //--------------------------------
            _card(
              title: "Version",
              icon: Icons.verified,
              child: const Text("v1.0.0 (Beta Release)"),
            ),

            const SizedBox(height: 30),

            //--------------------------------
            // FOOTER
            //--------------------------------
            const Text(
              "Made with ❤️ using Flutter",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(icon, color: Colors.deepPurple),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 13,
              height: 1.4,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}