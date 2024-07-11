import 'package:easy_localization/easy_localization.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({super.key});

  @override
  State<HistoricalPage> createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(
        title: tr('historical_page.title'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: EmptyWidget(
                image: historicalImagePath,
                title: 'Page not available yet',
                subTitle: 'Coming Soon!',
                titleTextStyle: TextStyle(
                  fontSize: 22,
                  color: AppThemes.darkTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 18,
                  color: AppThemes.darkTheme.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            right: 24,
            bottom: 16,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.restaurant_rounded),
              style: IconButton.styleFrom(
                backgroundColor: AppThemes.darkTheme.primaryColor,
                fixedSize: const Size(50, 50),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Generate New'))),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

//! legacy
// Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Center(
//               child: EmptyWidget(
//                 image: historicalImagePath,
//                 title: 'Page not available yet',
//                 subTitle: 'Coming Soon!',
//                 titleTextStyle: TextStyle(
//                   fontSize: 22,
//                   color: AppThemes.darkTheme.primaryColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 subtitleTextStyle: TextStyle(
//                   fontSize: 18,
//                   color: AppThemes.darkTheme.primaryColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 24,
//             bottom: 16,
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.restaurant_rounded),
//               style: IconButton.styleFrom(
//                 backgroundColor: AppThemes.darkTheme.primaryColor,
//                 fixedSize: Size(50, 50),
//               ),
//             ),
//           ),
//           Positioned(
//               bottom: 20,
//               child: ElevatedButton(
//                   onPressed: () {}, child: Text('Generate New'))),
//         ],
//       ),
