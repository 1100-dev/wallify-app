import 'dart:async';

import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  final PageController _pageController =
  PageController();

  int currentPage = 0;

  Timer? timer;

  final List<Map<String, String>>
  slides = [

    {
      "image":
      "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg",

      "title":
      "Nature Vibes",

      "subtitle":
      "Relax with beautiful nature wallpapers",
    },

    {
      "image":
      "https://images.pexels.com/photos/1631677/pexels-photo-1631677.jpeg",

      "title":
      "Dark Aesthetic",

      "subtitle":
      "Minimal & modern dark wallpapers",
    },

    {
      "image":
      "https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg",

      "title":
      "Car Collection",

      "subtitle":
      "Luxury and sports car wallpapers",
    },
  ];

  @override
  void initState() {

    super.initState();

    timer = Timer.periodic(

      const Duration(
        seconds: 3,
      ),

          (_) {

        if (currentPage <
            slides.length - 1) {

          currentPage++;

        } else {

          currentPage = 0;
        }

        _pageController.animateToPage(

          currentPage,

          duration: const Duration(
            milliseconds: 300,
          ),

          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {

    timer?.cancel();

    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(
      BuildContext context,
      ) {

    return SizedBox(

      height: 200,

      child: PageView.builder(

        controller:
        _pageController,

        itemCount:
        slides.length,

        itemBuilder:
            (context, index) {

          return _Slide(

            image:
            slides[index]["image"]!,

            title:
            slides[index]["title"]!,

            subtitle:
            slides[index]["subtitle"]!,
          );
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String image;

  final String title;

  final String subtitle;

  const _Slide({

    required this.image,

    required this.title,

    required this.subtitle,
  });

  @override
  Widget build(
      BuildContext context,
      ) {

    return Container(

      margin:
      const EdgeInsets.symmetric(
        horizontal: 10,
      ),

      decoration: BoxDecoration(

        borderRadius:
        BorderRadius.circular(18),

        image: DecorationImage(

          image:
          NetworkImage(image),

          fit:
          BoxFit.cover,
        ),
      ),

      child: Container(

        decoration: BoxDecoration(

          borderRadius:
          BorderRadius.circular(
            18,
          ),

          gradient:
          LinearGradient(

            begin:
            Alignment.bottomCenter,

            end:
            Alignment.topCenter,

            colors: [

              Colors.black.withValues(
                alpha: 0.7,
              ),

              Colors.transparent,
            ],
          ),
        ),

        padding:
        const EdgeInsets.all(
          16,
        ),

        child: Align(

          alignment:
          Alignment.bottomLeft,

          child: Column(

            mainAxisAlignment:
            MainAxisAlignment.end,

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(

                title,

                style:
                const TextStyle(

                  fontSize: 20,

                  fontWeight:
                  FontWeight.bold,

                  color:
                  Colors.white,
                ),
              ),

              const SizedBox(
                height: 6,
              ),

              Text(

                subtitle,

                style: TextStyle(
                  color:
                  Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class SliderWidget extends StatelessWidget {
//   const SliderWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: PageView(
//         children: const [
//           _Slide(
//             image: "assets/images/nature.png",
//             title: "Nature Vibes",
//             subtitle: "Relax with beautiful nature wallpapers",
//           ),
//           _Slide(
//             image: "assets/images/aesthetic.webp",
//             title: "Dark Aesthetic",
//             subtitle: "Minimal & modern dark wallpapers",
//           ),
//           _Slide(
//             image: "assets/images/car.png",
//             title: "Car Collection",
//             subtitle: "Luxury and sports car wallpapers",
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _Slide extends StatelessWidget {
//   final String image;
//   final String title;
//   final String subtitle;
//
//   const _Slide({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(18),
//         image: DecorationImage(
//           image: AssetImage(image),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.black.withOpacity(0.7),
//               Colors.transparent,
//             ],
//           ),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Align(
//           alignment: Alignment.bottomLeft,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   color: Colors.grey[300],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//}