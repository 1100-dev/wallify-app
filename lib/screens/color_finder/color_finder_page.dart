import 'package:flutter/material.dart';

import '../../services/wallpaper_api_service.dart';
import '../../widgets/wallpaper_card.dart';

class ColorFinderPage extends StatefulWidget {
  const ColorFinderPage({super.key});

  @override
  State<ColorFinderPage> createState() =>
      _ColorFinderPageState();
}

class _ColorFinderPageState
    extends State<ColorFinderPage> {

  List<dynamic> wallpapers = [];

  bool isLoading = false;

  String selectedColor = "";

  final List<Map<String, dynamic>> colors = [

    {
      "name": "Red",
      "color": Colors.red,
    },

    {
      "name": "Blue",
      "color": Colors.blue,
    },

    {
      "name": "Green",
      "color": Colors.green,
    },

    {
      "name": "Purple",
      "color": Colors.deepPurple,
    },

    {
      "name": "Pink",
      "color": Colors.pink,
    },

    {
      "name": "Black",
      "color": Colors.black,
    },

    {
      "name": "White",
      "color": Colors.grey.shade300,
    },

    {
      "name": "Orange",
      "color": Colors.orange,
    },
  ];

  Future<void> searchByColor(
      String colorName,
      ) async {

    setState(() {
      selectedColor = colorName;
      isLoading = true;
    });

    try {

      final data =
      await WallpaperApiService
          .searchWallpapers(
        "$colorName wallpaper",
      );

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFFF7F8FC),

      appBar: AppBar(
        title:
        const Text("Color Finder"),
        centerTitle: true,
      ),

      body: Column(

        children: [

          //--------------------------------
          // HEADER
          //--------------------------------
          Container(
            margin:
            const EdgeInsets.all(15),

            padding:
            const EdgeInsets.all(18),

            decoration: BoxDecoration(

              borderRadius:
              BorderRadius.circular(20),

              gradient:
              const LinearGradient(
                colors: [
                  Color(0xFF8E9EFF),
                  Color(0xFFC6B6FF),
                ],
              ),
            ),

            child: const Row(

              children: [

                Icon(
                  Icons.palette,
                  color: Colors.white,
                  size: 35,
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Text(
                    "Pick a color and discover matching wallpapers",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //--------------------------------
          // COLORS
          //--------------------------------
          SizedBox(
            height: 125,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              itemCount: colors.length,

              itemBuilder: (context, index) {

                final item = colors[index];

                final isSelected =
                    selectedColor ==
                        item["name"];

                return GestureDetector(

                  onTap: () {
                    searchByColor(
                      item["name"],
                    );
                  },

                  child: AnimatedContainer(

                    duration:
                    const Duration(
                      milliseconds: 250,
                    ),

                    margin:
                    const EdgeInsets.only(
                      right: 14,
                      top: 8,
                      bottom: 8,
                    ),

                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        //--------------------------------
                        // COLOR BUBBLE
                        //--------------------------------
                        Container(

                          width:
                          isSelected
                              ? 65
                              : 55,

                          height:
                          isSelected
                              ? 65
                              : 55,

                          decoration:
                          BoxDecoration(

                            color:
                            item["color"],

                            shape:
                            BoxShape.circle,

                            border:
                            Border.all(
                              color:
                              isSelected
                                  ? Colors
                                  .deepPurple
                                  : Colors
                                  .white,

                              width: 4,
                            ),

                            boxShadow: [

                              BoxShadow(
                                color: Colors
                                    .black
                                    .withOpacity(
                                    0.12),

                                blurRadius:
                                12,

                                offset:
                                const Offset(
                                    0, 4),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //--------------------------------
                        // NAME
                        //--------------------------------
                        AnimatedContainer(

                          duration:
                          const Duration(
                            milliseconds:
                            250,
                          ),

                          padding:
                          const EdgeInsets
                              .symmetric(
                            horizontal:
                            12,
                            vertical: 4,
                          ),

                          decoration:
                          BoxDecoration(

                            color:
                            isSelected
                                ? Colors
                                .deepPurple
                                : Colors
                                .white,

                            borderRadius:
                            BorderRadius
                                .circular(
                                20),

                            boxShadow: [

                              BoxShadow(
                                color: Colors
                                    .black
                                    .withOpacity(
                                    0.05),

                                blurRadius:
                                8,
                              ),
                            ],
                          ),

                          child: Text(

                            item["name"],

                            style:
                            TextStyle(

                              fontSize:
                              12,

                              fontWeight:
                              FontWeight
                                  .w600,

                              color:
                              isSelected
                                  ? Colors
                                  .white
                                  : Colors
                                  .black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          //--------------------------------
          // RESULTS
          //--------------------------------
          Expanded(

            child: isLoading

                ? const Center(
              child:
              CircularProgressIndicator(),
            )

                : wallpapers.isEmpty

                ? const Center(
              child: Text(
                "Choose a color 🎨",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )

                : Padding(

              padding:
              const EdgeInsets
                  .all(10),

              child:
              GridView.builder(

                itemCount:
                wallpapers.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount:
                  2,

                  mainAxisSpacing:
                  10,

                  crossAxisSpacing:
                  10,

                  childAspectRatio:
                  0.65,
                ),

                itemBuilder:
                    (context, index) {

                  return WallpaperCard(

                    imageUrl:

                    wallpapers[index]
                    ["src"] !=
                        null

                        ? wallpapers[index]
                    ["src"]
                    ["portrait"]

                        : wallpapers[index]
                    ["image"] ??
                        "",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}