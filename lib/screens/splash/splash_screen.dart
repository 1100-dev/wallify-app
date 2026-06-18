import 'dart:async';

import 'package:flutter/material.dart';

import '../../navigation/bottom_nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() =>
      _SplashPageState();
}

class _SplashPageState
    extends State<SplashPage>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1200,
      ),
    )..repeat();

    //--------------------------------
    // 5 SECONDS
    //--------------------------------
    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
            const BottomNav(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //--------------------------------
      // PREMIUM BACKGROUND
      //--------------------------------
      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [

              Color(0xFF0F0F1A),
              Color(0xFF1A1633),
              Color(0xFF2A1F52),
            ],
          ),
        ),

        child: Center(

          child: Column(

            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              //--------------------------------
              // REALISTIC LOGO
              //--------------------------------
              Container(

                width: 140,
                height: 140,

                decoration: BoxDecoration(

                  shape: BoxShape.circle,

                  gradient:
                  const LinearGradient(

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [

                      Color(0xFF8E9EFF),
                      Color(0xFFC6B6FF),
                    ],
                  ),

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.deepPurple
                          .withOpacity(
                        0.5,
                      ),

                      blurRadius: 40,
                      spreadRadius: 8,
                    ),
                  ],
                ),

                child: Center(

                  child: Container(

                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(

                      shape:
                      BoxShape.circle,

                      color:
                      Colors.white
                          .withOpacity(
                        0.18,
                      ),
                    ),

                    child: const Icon(

                      Icons.auto_awesome,

                      size: 45,

                      color:
                      Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 35,
              ),

              //--------------------------------
              // BRAND
              //--------------------------------
              const Text(

                "Wallify",

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 34,

                  fontWeight:
                  FontWeight.bold,

                  letterSpacing: 2,
                ),
              ),

              const SizedBox(
                height: 8,
              ),


              const SizedBox(
                height: 45,
              ),

              //--------------------------------
              // LOADING DOTS
              //--------------------------------
              AnimatedBuilder(

                animation: controller,

                builder: (_, __) {

                  return Row(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: List.generate(
                      3,

                          (index) {

                        final value =
                            controller.value * 3;

                        return AnimatedContainer(

                          duration:
                          const Duration(
                            milliseconds:
                            300,
                          ),

                          margin:
                          const EdgeInsets
                              .symmetric(
                            horizontal: 5,
                          ),

                          width:
                          value >= index
                              ? 14
                              : 8,

                          height:
                          value >= index
                              ? 14
                              : 8,

                          decoration:
                          const BoxDecoration(

                            color:
                            Colors.white,

                            shape:
                            BoxShape.circle,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}