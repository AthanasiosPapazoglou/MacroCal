import 'package:easy_localization/easy_localization.dart';
// import 'package:empty_widget/empty_widget.dart';
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
            child: const Center(child: Text('Empty')
                // EmptyWidget(
                //   image: historicalImagePath,
                //   title: 'Page not available yet',
                //   subTitle: 'Coming Soon!',
                //   titleTextStyle: TextStyle(
                //     fontSize: 22,
                //     color: AppThemes.darkTheme.primaryColor,
                //     fontWeight: FontWeight.w500,
                //   ),
                //   subtitleTextStyle: TextStyle(
                //     fontSize: 18,
                //     color: AppThemes.darkTheme.primaryColor,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
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
      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Container(
      //           padding: EdgeInsetsDirectional.all(16),
      //           width: double.maxFinite,
      //           height: 300,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(16),
      //               border: Border.all(
      //                   width: 3, color: AppThemes.darkTheme.primaryColor)),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [Text('Start Date'), Text('8/1/2023')],
      //               ),
      //               SizedBox(
      //                 height: 4,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [Text('End Date'), Text('30/1/2024')],
      //               ),
      //               Divider(
      //                 color: AppThemes.darkTheme.primaryColor,
      //               ),
      //               SizedBox(
      //                 height: 6,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text('Macronutrients'),
      //                   Row(
      //                     children: [
      //                       Padding(
      //                           padding: EdgeInsets.symmetric(horizontal: 10),
      //                           child: Text('AVG')),
      //                       Padding(
      //                           padding: EdgeInsets.symmetric(horizontal: 10),
      //                           child: Text('Limit')),
      //                       Padding(
      //                           padding: EdgeInsets.symmetric(horizontal: 10),
      //                           child: Text('%')),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: 16,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text('Protein'),
      //                   Row(
      //                     children: [
      //                       Padding(
      //                         padding:
      //                             const EdgeInsets.symmetric(horizontal: 20.0),
      //                         child: Text('80'),
      //                       ),
      //                       Padding(
      //                         padding:
      //                             const EdgeInsets.symmetric(horizontal: 8.0),
      //                         child: Text('>100'),
      //                       ),
      //                       Padding(
      //                         padding:
      //                             const EdgeInsets.symmetric(horizontal: 8.0),
      //                         child: Text('80'),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
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
