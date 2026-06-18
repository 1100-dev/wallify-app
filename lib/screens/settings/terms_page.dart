import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        centerTitle: true,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF7F8FC),
              Color(0xFFE9ECF5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //--------------------------------
              // HEADER CARD
              //--------------------------------
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8E9EFF),
                      Color(0xFFC6B6FF),
                    ],
                  ),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wallify Terms",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Please read carefully before using the app",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _card(
                title: "1. Usage",
                text:
                "Wallify is designed for personal use only. Any misuse, reverse engineering, or unauthorized distribution is strictly prohibited.",
              ),

              _card(
                title: "2. Content Ownership",
                text:
                "Wallpapers are fetched from external sources. We do not claim ownership unless stated. Content belongs to their respective creators.",
              ),

              _card(
                title: "3. User Responsibility",
                text:
                "Users are responsible for how they use downloaded wallpapers. We are not liable for any misuse or third-party issues.",
              ),

              _card(
                title: "4. Privacy",
                text:
                "We respect your privacy. No personal data is sold or shared. Firebase may be used only for authentication and storage.",
              ),

              _card(
                title: "5. Updates",
                text:
                "These terms may change over time. Continued use of Wallify means you accept the updated terms.",
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Last updated: 2026 • Wallify",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //--------------------------------
  // CARD WIDGET
  //--------------------------------
  Widget _card({required String title, required String text}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
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
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              height: 1.5,
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}