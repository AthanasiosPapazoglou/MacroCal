import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/pages/food_bank_page.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/pages/profile_page.dart';
import 'package:macro_cal_public/pages/historical_page.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

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
              icon: tabIcon(context, todayImagePath),
              text: context.l10n.tabBarOverview,
            ),
            Tab(
              icon: tabIcon(context, foodsImagePath),
              text: context.l10n.tabBarFoodBank,
            ),
            Tab(
              icon: tabIcon(context, historicalImagePath),
              text: context.l10n.tabBarHistorical,
            ),
            Tab(
              icon: tabIcon(context, profileImagePath),
              text: context.l10n.tabBarProfile,
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
