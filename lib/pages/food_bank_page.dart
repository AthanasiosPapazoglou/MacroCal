// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/pages/create_ingredient_page.dart';
import 'package:macro_cal_public/pages/ingredient_details_page.dart';
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class FoodBankPage extends StatefulWidget {
  const FoodBankPage({
    super.key,
  });

  @override
  State<FoodBankPage> createState() => _IngredientsPageViewState();
}

class _IngredientsPageViewState extends State<FoodBankPage> {
  final DataController dataController = Get.find();
  bool isSelected = false;
  bool isActiveFilter = false;
  List<int> indexesOfFiltered = [];

  late TextEditingController _searchBarController;
  late bool isSearchActivated;
  late bool isListView;

  void getFilteredIngredientList(String val) {
    indexesOfFiltered.clear();
    dataController.ingredientsList.asMap().forEach((index, value) {
      if (value.ingridientName!.toLowerCase().contains(val.toLowerCase()) &&
          val != '') {
        indexesOfFiltered.add(index);
      }
    });
  }

  bool shouldDisplayEmptyWidget() {
    if (isActiveFilter) {
      return (indexesOfFiltered.isEmpty) ? true : false;
    } else {
      return (dataController.ingredientsList.isEmpty) ? true : false;
    }
  }

  int getNumberOfGridChildren (){
    double screenWidth = MediaQuery.of(context).size.width;
    
      return (screenWidth/120.floor()).toInt();
    
  }

  stateManipulationCallback() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchBarController = TextEditingController();
    isSearchActivated = false;
    isListView = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(
        title: tr('foods_page.title'),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                heightSpacer(12),
                Expanded(
                  child: Column(
                    children: [
                      topSideActionBar(),
                      if (isSearchActivated) filterSearchBar(),
                      FoodList(),
                    ],
                  ),
                ),
                heightSpacer(56),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateOrEditIngredientPage(
                rebuildIngredientsDetailsPage: () {},
                rebuildIngredientsPage: stateManipulationCallback,
                isEdit: false,
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.format_list_bulleted_add,
          size: 30,
        ),
        style: IconButton.styleFrom(
          backgroundColor: AppThemes.darkTheme.primaryColor,
          fixedSize: const Size(50, 50),
        ),
      ),
    );
  }

  Padding topSideActionBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.sort_rounded),
              const SizedBox(width: 4),
              Text(tr('foods_page.top_action_bar.sort'))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isListView = !isListView;
                });
              },
              child: Icon(!isListView
                  ? Icons.table_rows_rounded
                  : Icons.window_rounded)),
          ElevatedButton(
            onPressed: () {
              indexesOfFiltered.clear();
              isActiveFilter = false;
              _searchBarController.clear();
              setState(() {});
              setState(() {
                isSearchActivated = !isSearchActivated;
              });
            },
            child: Icon(
              isSearchActivated
                  ? Icons.search_off_rounded
                  : Icons.search_rounded,
              size: 25,
              color: isSearchActivated ? AppColors.redAccent : null,
            ),
          ),
        ],
      ),
    );
  }

  ///Search bar that appears if the search button is pressed
  Column filterSearchBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: TextField(
            onChanged: (val) {
              getFilteredIngredientList(val);
              setState(() {});
              (indexesOfFiltered.isEmpty && val == '')
                  ? isActiveFilter = false
                  : isActiveFilter = true;
            },
            controller: _searchBarController,
            textInputAction: TextInputAction.done,
            style: const TextStyle(color: AppColors.kPrimaryColor),
            decoration: InputDecoration(
              fillColor: AppThemes.darkTheme.canvasColor,
              border: InputBorder.none,
              hintText: tr('foods_page.top_action_bar.search_hint'),
              hintStyle: const TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 15,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  indexesOfFiltered.clear();
                  _searchBarController.clear();
                  isActiveFilter = false;
                  setState(() {});
                },
                child: const Icon(
                  Icons.cancel_outlined,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.kPrimaryColor,
              ),
              contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 8),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Expanded FoodList() {
    return Expanded(
      child: shouldDisplayEmptyWidget()
          ? EmptyWidget(
              packageImage: PackageImage.Image_2,
              title: isActiveFilter
                  ? tr('foods_page.empty_page.title_no_results')
                  : tr('foods_page.empty_page.title_no_items'),
              titleTextStyle: TextStyle(
                fontSize: 22,
                color: AppThemes.darkTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            )
          : isListView
              ? ListView.builder(
                  itemCount: isActiveFilter
                      ? indexesOfFiltered.length
                      : dataController.ingredientsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ingredientItem(
                        ingredientIndex:
                            isActiveFilter ? indexesOfFiltered[index] : index,
                        stateManipulationCallback: stateManipulationCallback);
                  },
                )
              : GridView.builder(
                  itemCount: isActiveFilter
                      ? indexesOfFiltered.length
                      : dataController.ingredientsList.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getNumberOfGridChildren() as int,
                    childAspectRatio: 1,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ingredientItem(
                        ingredientIndex:
                            isActiveFilter ? indexesOfFiltered[index] : index,
                        stateManipulationCallback: stateManipulationCallback);
                  },
                ),
    );
  }

  Widget ingredientItem({
    required int ingredientIndex,
    required Function stateManipulationCallback,
  }) {
    final DataController dataController = Get.find();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IngredientDetailsPage(
                ingredientIndex: ingredientIndex,
                stateManipulationCallback: stateManipulationCallback),
          ),
        );
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 8, horizontal: isListView ? 0 : 8),
        child: Container(
          padding: const EdgeInsets.all(4),
          // width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: AppThemes.darkTheme.primaryColor,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              dataController.ingredientsList[ingredientIndex].ingridientName ??
                  '',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
