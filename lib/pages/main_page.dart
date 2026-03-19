import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/pages/food_bank_page.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/pages/profile_page.dart';
import 'package:macro_cal_public/pages/historical_page.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';

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
              text: LocaleConsts.tabBarOverview.tr(),
            ),
            Tab(
              icon: Image.asset(
                foodsImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: LocaleConsts.tabBarFoodBank.tr(),
            ),
            Tab(
              icon: Image.asset(
                historicalImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: LocaleConsts.tabBarHistorical.tr(),
            ),
            Tab(
              icon: Image.asset(
                profileImagePath,
                width: navTabsImageSize,
                height: navTabsImageSize,
              ),
              text: LocaleConsts.tabBarProfile.tr(),
            ),
          ],
        ),
      ),
      body: const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          TodaysPage(),
          FoodBankPage(),
          HistoricalPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}
