import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            //--------------------------------
            // INTRO CARD
            //--------------------------------
            _buildCard(
              title: "Introduction",
              content:
              "Wallify is a wallpaper application that allows users to browse, download, and save wallpapers easily.",
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // DATA COLLECTION
            //--------------------------------
            _buildCard(
              title: "Information We Collect",
              content:
              "• Email address (if user logs in)\n"
                  "• Firebase User ID\n"
                  "• Favorite wallpapers\n"
                  "• Basic app usage data",
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // HOW WE USE DATA
            //--------------------------------
            _buildCard(
              title: "How We Use Information",
              content:
              "We use collected data to:\n"
                  "• Provide login functionality\n"
                  "• Save user favorites\n"
                  "• Improve app experience\n"
                  "• Sync data across devices",
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // THIRD PARTY
            //--------------------------------
            _buildCard(
              title: "Third-Party Services",
              content:
              "We use Firebase for authentication and database services. "
                  "We also use wallpaper APIs to fetch images.",
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // DATA SECURITY
            //--------------------------------
            _buildCard(
              title: "Data Security",
              content:
              "We use secure Firebase rules to protect user data. "
                  "Your information is never sold or shared.",
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // USER RIGHTS
            //--------------------------------
            _buildCard(
              title: "User Rights",
              content:
              "Users can:\n"
                  "• Logout anytime\n"
                  "• Remove app data by clearing storage\n"
                  "• Delete favorites anytime",
            ),

            const SizedBox(height: 15),

            //--------------------------------
            // CONTACT
            //--------------------------------
            _buildCard(
              title: "Contact Us",
              content:
              "If you have any questions, contact us at:\n"
                  "wallify.support@gmail.com",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //--------------------------------
  // CARD WIDGET
  //--------------------------------
  Widget _buildCard({
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}