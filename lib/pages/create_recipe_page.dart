import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class CreateRecipePage extends StatefulWidget {
  const CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, // Number of tabs
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Recipe',
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: Column(children: [scrollableFoodList()]),
      bottomNavigationBar: bottomSideNavbar(),
    );
  }

  Expanded scrollableFoodList() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///Bottom tab bar that changes between all/filtered list of products
  TabBar bottomSideNavbar() {
    return TabBar(controller: _tabController, tabs: [
      Tab(
        text: 'Ingredients',
        icon: Image.asset(
          pantryImagePath,
          width: 30,
          height: 30,
        ),
      ),
      Tab(
        text: 'Additional Data',
        icon: Image.asset(
          consumptionImagePath,
          width: 30,
          height: 30,
        ),
      ),
    ]);
  }
}
