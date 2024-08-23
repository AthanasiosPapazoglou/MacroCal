import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/pages/food_bank_page.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/pages/assistant_page.dart';
import 'package:macro_cal_public/pages/profile_page.dart';
import 'package:macro_cal_public/pages/historical_page.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: TabBar(
          tabs: [
            Tab(
              icon: Image.asset(
                todayImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: tr('tab_bar.overview'),
            ),
            Tab(
              icon: Image.asset(
                foodsImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: tr('tab_bar.food_bank'),
            ),
            Tab(
              icon: Image.asset(
                assistantImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: tr('tab_bar.assistant'),
            ),
            Tab(
              icon: Image.asset(
                historicalImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: tr('tab_bar.historical'),
            ),
            Tab(
              icon: Image.asset(
                profileImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: tr('tab_bar.profile'),
            ),
          ],
        ),
      ),
      body: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          TodaysPage(),
          FoodBankPage(),
          AssistantPage(),
          HistoricalPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
