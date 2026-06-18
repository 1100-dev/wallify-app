

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../settings/settings_page.dart';
import '../../services/wallpaper_api_service.dart';
import '../../widgets/category_tile.dart';
import '../../widgets/slider_widget.dart';
import '../../widgets/wallpaper_card.dart';

import '../auth/login_page.dart';
import '../auth/signup_page.dart';
import '../favorites/favorites_page.dart';
import '../settings/about_page.dart';
import '../settings/terms_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> wallpapers = [];
  bool isLoading = true;

  final categories = [
    "All",
    "Car",
    "Nature",
    "Aesthetic",
    "Mountains",
    "Winter",
    "Anime",
    "Animals",
    "Streets",
    "Neon",
    "Beach",
    "Dark",
    "Ocean",
    "Desert",
    "Sky",
    "Gaming",
    "Rain",
    "Trees",
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    loadWallpapers();
  }

  // -------------------------
  // LOAD TRENDING WALLPAPERS
  // -------------------------
  Future<void> loadWallpapers() async {
    try {
      final data =
      await WallpaperApiService.getTrendingWallpapers();

      setState(() {
        wallpapers = data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // -------------------------
  // LOAD CATEGORY WALLPAPERS
  // -------------------------
  Future<void> loadCategory(String category) async {
    setState(() {
      isLoading = true;
    });

    try {
      final data =
      await WallpaperApiService.searchWallpapers(category);

      setState(() {
        wallpapers = data ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // -------------------------
  // DRAWER
  // -------------------------
  Widget buildDrawer(User? user) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8E9EFF),
                  Color(0xFFC6B6FF),
                ],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                user?.email != null
                    ? user!.email![0].toUpperCase()
                    : "G",
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            accountName: Text(
              user != null ? "Welcome Back" : "Guest User",
            ),
            accountEmail: Text(
              user?.email ?? "Not logged in",
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "ACCOUNT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favorites"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FavoritesPage(),
                ),
              );
            },
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "APP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About App"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutPage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Terms & Conditions"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TermsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          const Divider(),

          if (user == null)
            ListTile(
              leading: const Icon(Icons.login, color: Colors.blue),
              title: const Text("Login"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                );
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
            ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // -------------------------
  // BODY
  // -------------------------
  Widget buildBody() {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),

          const SliderWidget(),

          const SizedBox(height: 15),

          // CATEGORIES
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryTile(
                  title: categories[index],
                  isSelected: selectedIndex == index,
                  onTap: () async {
                    setState(() {
                      selectedIndex = index;
                    });

                    if (categories[index] == "All") {
                      loadWallpapers();
                    } else {
                      await loadCategory(categories[index]);
                    }
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          // WALLPAPERS GRID
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: wallpapers.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return WallpaperCard(
                  imageUrl: wallpapers[index]["src"] != null
                      ? wallpapers[index]["src"]["portrait"]
                      : wallpapers[index]["image"] ?? "",
                );
              },
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // -------------------------
  // BUILD UI
  // -------------------------
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Wallify"),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,

            actions: [
              if (user == null) ...[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ],
          ),

          drawer: buildDrawer(user),
          body: buildBody(),
        );
      },
    );
  }
}