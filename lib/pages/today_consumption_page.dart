import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
// import 'package:empty_widget/empty_widget.dart';

class TodayConsumption extends StatefulWidget {
  const TodayConsumption({super.key});

  @override
  State<TodayConsumption> createState() => _TodayConsumptionState();
}

class _TodayConsumptionState extends State<TodayConsumption>
    with SingleTickerProviderStateMixin {
  late int maxLength;
  late List<TextEditingController> _controllers;
  final DataController dataController = Get.find();
  late TabController _tabController;
  late TextEditingController _searchBarController;
  int ingredientListIndex = 0;
  int ingredientListNestedIndex = 0;
  late bool isSearchActivated;
  bool isActiveFilter = false;

  List<int> indexesOfConsumed = [];
  List<int> indexesOfFiltered = [];

  int totalIngredients() => dataController.ingredientsList.length;

  void getConsumedIngredientList() {
    indexesOfConsumed.clear();
    dataController.ingredientQuantitiesList.asMap().forEach((index, value) {
      if (value != 0) {
        indexesOfConsumed.add(index);
      }
    });
  }

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

  bool isUnconsumedTabSelected() {
    return (_tabController.index == 0);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2, // Number of tabs
      vsync: this,
    );
    maxLength = totalIngredients();
    _controllers =
        List.generate(totalIngredients(), (_) => TextEditingController());
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text =
          dataController.ingredientQuantitiesList[i].toString();
    }
    for (var controller in _controllers) {
      controller.addListener(() {
        if (controller.text.length > 4) {
          controller.text = controller.text.substring(0, 4);
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
      });
    }
    _searchBarController = TextEditingController();
    isSearchActivated = false;
    getConsumedIngredientList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _tabController.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('consumption_page.title'),
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          TopSideActionBar(context),
          if (isSearchActivated && isUnconsumedTabSelected()) filterSearchBar(),
          scrollableFoodList(),
        ],
      ),
      bottomNavigationBar: bottomSideNavbar(),
    );
  }

  ///Reset/Save/Search action button row in the upper part of the page
  Column TopSideActionBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _showResetValuesPopupDialog();
                  },
                  child: Text(
                    tr('consumption_page.top_action_bar.reset_values'),
                    style: const TextStyle(color: AppColors.orange),
                  )),
              ElevatedButton(
                  onPressed: () {
                    populateConsumptionVariables();
                    dataController.update();
                    storage.globalDataSave();
                    getConsumedIngredientList();
                    Navigator.pop(context);
                  },
                  child: Text(
                    tr('consumption_page.top_action_bar.save_changes'),
                  )),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: (isUnconsumedTabSelected()
                        ? null
                        : WidgetStateProperty.all<Color>(
                            AppThemes.darkTheme.disabledColor))),
                onPressed: () {
                  if (isUnconsumedTabSelected()) {
                    indexesOfFiltered.clear();
                    isActiveFilter = false;
                    _searchBarController.clear();
                    setState(() {});
                    setState(() {
                      isSearchActivated = !isSearchActivated;
                    });
                  }
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
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  ///Search bar that appears if the search button is pressed
  Column filterSearchBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
              hintText: tr('consumption_page.top_action_bar.search_hint'),
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

  ///list of food products available to register consumption values
  Expanded scrollableFoodList() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          ingredientItemsView(true, isActiveFilter),
          (indexesOfConsumed.isEmpty)
              ? EmptyConsumedPage()
              : ingredientItemsView(false, isActiveFilter)
        ],
      ),
    );
  }

  ///Bottom tab bar that changes between all/filtered list of products
  TabBar bottomSideNavbar() {
    return TabBar(
        controller: _tabController,
        onTap: (_) {
          if (isUnconsumedTabSelected()) {
            setState(() {});
          } else {
            setState(() {
              isSearchActivated = false;
              isActiveFilter = false;
            });
          }
        },
        tabs: [
          Tab(
            text: tr('consumption_page.bottom_action_bar.all_foods'),
            icon: Image.asset(
              pantryImagePath,
              width: 30,
              height: 30,
            ),
          ),
          Tab(
            text: tr('consumption_page.bottom_action_bar.consumed'),
            icon: Image.asset(
              consumptionImagePath,
              width: 30,
              height: 30,
            ),
          ),
        ]);
  }

  ///List view after being filtered by search bar
  Widget ingredientItemsView(bool isUnconsumedList, bool isActiveFilter) {
    return shouldDisplayEmptyWidget()
        ? const Text('Empty')
        // EmptyWidget(
        //     packageImage: PackageImage.Image_2,
        //     title: isActiveFilter
        //         ? 'No items found matching your search criteria'
        //         : 'No items included in your list yet',
        //     titleTextStyle: TextStyle(
        //       fontSize: 22,
        //       color: AppThemes.darkTheme.primaryColor,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   )
        : ListView.builder(
            itemCount: isUnconsumedList
                ? isActiveFilter
                    ? indexesOfFiltered.length
                    : totalIngredients()
                : indexesOfConsumed.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                child: Container(
                  width: double.maxFinite,
                  height: 62,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 2, color: AppThemes.darkTheme.primaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: SizedBox(
                          width: 180,
                          child: Text(
                            dataController
                                    .ingredientsList[isUnconsumedList
                                        ? isActiveFilter
                                            ? indexesOfFiltered[index]
                                            : index
                                        : indexesOfConsumed[index]]
                                    .ingridientName ??
                                '',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            tr('consumption_page.metrics.grams'),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              height: 48,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    dataController.ingredientQuantitiesList[
                                            isUnconsumedList
                                                ? isActiveFilter
                                                    ? indexesOfFiltered[index]
                                                    : index
                                                : indexesOfConsumed[index]] =
                                        int.tryParse(value) ?? 0;
                                  },
                                  controller: _controllers[isUnconsumedList
                                      ? isActiveFilter
                                          ? indexesOfFiltered[index]
                                          : index
                                      : indexesOfConsumed[index]],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hoverColor: AppThemes.darkTheme.canvasColor,
                                    fillColor:
                                        AppThemes.darkTheme.disabledColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
  }

  Widget EmptyConsumedPage() {
    return const Text('Empty');
    // EmptyWidget(
    //   image: addFoodImagePath,
    //   // packageImage: PackageImage.Image_2,
    //   title: tr('consumption_page.empty_page.title'),
    //   subTitle: tr('consumption_page.empty_page.subTitle'),
    //   titleTextStyle: TextStyle(
    //     fontSize: 22,
    //     color: AppThemes.darkTheme.primaryColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   subtitleTextStyle: TextStyle(
    //     fontSize: 14,
    //     color: AppThemes.darkTheme.primaryColor,
    //   ),
    // );
  }

  ///Pop up dialog to reset consumption
  void _showResetValuesPopupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr('consumption_page.reset_values_dialog.title')),
          content: Text(tr('consumption_page.reset_values_dialog.body')),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                tr('consumption_page.reset_values_dialog.cancel'),
                style: const TextStyle(color: AppColors.redAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                resetIngredientQuantitiesList();
                populateConsumptionVariables();
                dataController.update();
                storage.globalDataSave();
                getConsumedIngredientList();
                Navigator.of(context).pop();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodayConsumption(),
                  ),
                );
              },
              child: Text(tr('consumption_page.reset_values_dialog.confirm')),
            ),
          ],
        );
      },
    );
  }
}
