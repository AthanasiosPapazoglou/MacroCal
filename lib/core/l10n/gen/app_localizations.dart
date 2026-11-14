import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_el.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('el'),
    Locale('en'),
  ];

  /// No description provided for @tabBarOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get tabBarOverview;

  /// No description provided for @tabBarFoodBank.
  ///
  /// In en, this message translates to:
  /// **'Food Bank'**
  String get tabBarFoodBank;

  /// No description provided for @tabBarHistorical.
  ///
  /// In en, this message translates to:
  /// **'Historical'**
  String get tabBarHistorical;

  /// No description provided for @tabBarProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabBarProfile;

  /// No description provided for @overviewPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overviewPageTitle;

  /// No description provided for @overviewPageIntake.
  ///
  /// In en, this message translates to:
  /// **'Calory intake'**
  String get overviewPageIntake;

  /// No description provided for @overviewPageIntakeInfoKcal.
  ///
  /// In en, this message translates to:
  /// **'kcal.'**
  String get overviewPageIntakeInfoKcal;

  /// No description provided for @overviewPageIntakeInfoRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining:'**
  String get overviewPageIntakeInfoRemaining;

  /// No description provided for @overviewPageIntakeInfoExceeding.
  ///
  /// In en, this message translates to:
  /// **'Exceeding by:'**
  String get overviewPageIntakeInfoExceeding;

  /// No description provided for @overviewPageHealthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy Nutrients'**
  String get overviewPageHealthy;

  /// No description provided for @overviewPageUnhealthy.
  ///
  /// In en, this message translates to:
  /// **'Unhealthy Nutrients'**
  String get overviewPageUnhealthy;

  /// No description provided for @overviewPageNutrientsProtein.
  ///
  /// In en, this message translates to:
  /// **'Proteins'**
  String get overviewPageNutrientsProtein;

  /// No description provided for @overviewPageNutrientsFiber.
  ///
  /// In en, this message translates to:
  /// **'Diatery Fiber'**
  String get overviewPageNutrientsFiber;

  /// No description provided for @overviewPageNutrientsSugars.
  ///
  /// In en, this message translates to:
  /// **'Sugars'**
  String get overviewPageNutrientsSugars;

  /// No description provided for @overviewPageNutrientsSaturated.
  ///
  /// In en, this message translates to:
  /// **'Saturated Fats'**
  String get overviewPageNutrientsSaturated;

  /// No description provided for @overviewPageNutrientsSalt.
  ///
  /// In en, this message translates to:
  /// **'Salt (mg)'**
  String get overviewPageNutrientsSalt;

  /// No description provided for @consumptionPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Consumption:'**
  String get consumptionPageTitle;

  /// No description provided for @consumptionPageTopActionBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Consumption'**
  String get consumptionPageTopActionBarTitle;

  /// No description provided for @consumptionPageTopActionBarResetValues.
  ///
  /// In en, this message translates to:
  /// **'Reset Values'**
  String get consumptionPageTopActionBarResetValues;

  /// No description provided for @consumptionPageTopActionBarSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get consumptionPageTopActionBarSaveChanges;

  /// No description provided for @consumptionPageTopActionBarSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Ingredient by name'**
  String get consumptionPageTopActionBarSearchHint;

  /// No description provided for @consumptionPageMetricsGrams.
  ///
  /// In en, this message translates to:
  /// **'Grams:'**
  String get consumptionPageMetricsGrams;

  /// No description provided for @consumptionPageBottomActionBarAllFoods.
  ///
  /// In en, this message translates to:
  /// **'All Foods'**
  String get consumptionPageBottomActionBarAllFoods;

  /// No description provided for @consumptionPageBottomActionBarConsumed.
  ///
  /// In en, this message translates to:
  /// **'Consumed'**
  String get consumptionPageBottomActionBarConsumed;

  /// No description provided for @consumptionPageEmptyPageTitle.
  ///
  /// In en, this message translates to:
  /// **'This page is empty.'**
  String get consumptionPageEmptyPageTitle;

  /// No description provided for @consumptionPageEmptyPageSubTitle.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t eaten anything yet.'**
  String get consumptionPageEmptyPageSubTitle;

  /// No description provided for @consumptionPageResetValuesDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Required'**
  String get consumptionPageResetValuesDialogTitle;

  /// No description provided for @consumptionPageResetValuesDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you wish to reset today\'s food consumption?'**
  String get consumptionPageResetValuesDialogBody;

  /// No description provided for @consumptionPageResetValuesDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get consumptionPageResetValuesDialogCancel;

  /// No description provided for @consumptionPageResetValuesDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get consumptionPageResetValuesDialogConfirm;

  /// No description provided for @activitiesPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Activities: '**
  String get activitiesPageTitle;

  /// No description provided for @activitiesPageMetricsDistance.
  ///
  /// In en, this message translates to:
  /// **'kilometers'**
  String get activitiesPageMetricsDistance;

  /// No description provided for @activitiesPageBottomActionBarResetValues.
  ///
  /// In en, this message translates to:
  /// **'Reset Values'**
  String get activitiesPageBottomActionBarResetValues;

  /// No description provided for @activitiesPageBottomActionBarSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get activitiesPageBottomActionBarSaveChanges;

  /// No description provided for @activitiesPageResetValuesDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Required'**
  String get activitiesPageResetValuesDialogTitle;

  /// No description provided for @activitiesPageResetValuesDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you wish to reset today\'s activity volumes?'**
  String get activitiesPageResetValuesDialogBody;

  /// No description provided for @activitiesPageResetValuesDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get activitiesPageResetValuesDialogCancel;

  /// No description provided for @activitiesPageResetValuesDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get activitiesPageResetValuesDialogConfirm;

  /// No description provided for @foodsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get foodsPageTitle;

  /// No description provided for @foodsPageTopActionBarSort.
  ///
  /// In en, this message translates to:
  /// **'Sort by:'**
  String get foodsPageTopActionBarSort;

  /// No description provided for @foodsPageTopActionBarSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Food by name'**
  String get foodsPageTopActionBarSearchHint;

  /// No description provided for @foodsPageEmptyPageTitleNoResults.
  ///
  /// In en, this message translates to:
  /// **'No items found matching your search criteria'**
  String get foodsPageEmptyPageTitleNoResults;

  /// No description provided for @foodsPageEmptyPageTitleNoItems.
  ///
  /// In en, this message translates to:
  /// **'No items included in your list yet'**
  String get foodsPageEmptyPageTitleNoItems;

  /// No description provided for @foodsPageEmptyPageSubTitle.
  ///
  /// In en, this message translates to:
  /// **'No items included in your list yet'**
  String get foodsPageEmptyPageSubTitle;

  /// No description provided for @ingredientsPageTitlesAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Ingredient'**
  String get ingredientsPageTitlesAdd;

  /// No description provided for @ingredientsPageTitlesEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Ingredient'**
  String get ingredientsPageTitlesEdit;

  /// No description provided for @ingredientsPageHints0.
  ///
  /// In en, this message translates to:
  /// **'Reference quantity for metrics'**
  String get ingredientsPageHints0;

  /// No description provided for @ingredientsPageHints1.
  ///
  /// In en, this message translates to:
  /// **'Name of the ingredient'**
  String get ingredientsPageHints1;

  /// No description provided for @ingredientsPageHints2.
  ///
  /// In en, this message translates to:
  /// **'Name of category'**
  String get ingredientsPageHints2;

  /// No description provided for @ingredientsPageHints3.
  ///
  /// In en, this message translates to:
  /// **'Total amount of Calories (Kcal.)'**
  String get ingredientsPageHints3;

  /// No description provided for @ingredientsPageHints4.
  ///
  /// In en, this message translates to:
  /// **'Total amount of Fats (gr.)'**
  String get ingredientsPageHints4;

  /// No description provided for @ingredientsPageHints5.
  ///
  /// In en, this message translates to:
  /// **'Specific amount of saturated/trans Fats (gr.)'**
  String get ingredientsPageHints5;

  /// No description provided for @ingredientsPageHints6.
  ///
  /// In en, this message translates to:
  /// **'Total amount of Carbohydrates (gr.)'**
  String get ingredientsPageHints6;

  /// No description provided for @ingredientsPageHints7.
  ///
  /// In en, this message translates to:
  /// **'Specific amount of Simple Carbs/Sugars (gr.)'**
  String get ingredientsPageHints7;

  /// No description provided for @ingredientsPageHints8.
  ///
  /// In en, this message translates to:
  /// **'Total amount of Dietary Fiber (gr.)'**
  String get ingredientsPageHints8;

  /// No description provided for @ingredientsPageHints9.
  ///
  /// In en, this message translates to:
  /// **'Total amount of Protein (gr.)'**
  String get ingredientsPageHints9;

  /// No description provided for @ingredientsPageHints10.
  ///
  /// In en, this message translates to:
  /// **'Total amount of salt (gr.)'**
  String get ingredientsPageHints10;

  /// No description provided for @ingredientsPageLabels0.
  ///
  /// In en, this message translates to:
  /// **'Reference Quantity'**
  String get ingredientsPageLabels0;

  /// No description provided for @ingredientsPageLabels1.
  ///
  /// In en, this message translates to:
  /// **'Ingrident Name'**
  String get ingredientsPageLabels1;

  /// No description provided for @ingredientsPageLabels2.
  ///
  /// In en, this message translates to:
  /// **'Ingredient Category'**
  String get ingredientsPageLabels2;

  /// No description provided for @ingredientsPageLabels3.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get ingredientsPageLabels3;

  /// No description provided for @ingredientsPageLabels4.
  ///
  /// In en, this message translates to:
  /// **'Total Fat'**
  String get ingredientsPageLabels4;

  /// No description provided for @ingredientsPageLabels5.
  ///
  /// In en, this message translates to:
  /// **'Saturated/Trans Fat'**
  String get ingredientsPageLabels5;

  /// No description provided for @ingredientsPageLabels6.
  ///
  /// In en, this message translates to:
  /// **'Total Carbohydrates'**
  String get ingredientsPageLabels6;

  /// No description provided for @ingredientsPageLabels7.
  ///
  /// In en, this message translates to:
  /// **'Sugars'**
  String get ingredientsPageLabels7;

  /// No description provided for @ingredientsPageLabels8.
  ///
  /// In en, this message translates to:
  /// **'Dietary Fiber'**
  String get ingredientsPageLabels8;

  /// No description provided for @ingredientsPageLabels9.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get ingredientsPageLabels9;

  /// No description provided for @ingredientsPageLabels10.
  ///
  /// In en, this message translates to:
  /// **'Salt'**
  String get ingredientsPageLabels10;

  /// No description provided for @ingredientsPageBottomSideActionsSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get ingredientsPageBottomSideActionsSaveButton;

  /// No description provided for @ingredientDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Ingredient Details:'**
  String get ingredientDetailsTitle;

  /// No description provided for @ingredientDetailsInfoBoard.
  ///
  /// In en, this message translates to:
  /// **'Nutritional Facts Per: '**
  String get ingredientDetailsInfoBoard;

  /// No description provided for @ingredientDetailsNutrientsCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get ingredientDetailsNutrientsCalories;

  /// No description provided for @ingredientDetailsNutrientsFat.
  ///
  /// In en, this message translates to:
  /// **'Total Fat'**
  String get ingredientDetailsNutrientsFat;

  /// No description provided for @ingredientDetailsNutrientsSaturated.
  ///
  /// In en, this message translates to:
  /// **'Saturated/Trans Fat'**
  String get ingredientDetailsNutrientsSaturated;

  /// No description provided for @ingredientDetailsNutrientsCarbs.
  ///
  /// In en, this message translates to:
  /// **'Total Carbohydrates'**
  String get ingredientDetailsNutrientsCarbs;

  /// No description provided for @ingredientDetailsNutrientsSugars.
  ///
  /// In en, this message translates to:
  /// **'Sugars'**
  String get ingredientDetailsNutrientsSugars;

  /// No description provided for @ingredientDetailsNutrientsFiber.
  ///
  /// In en, this message translates to:
  /// **'Dietary Fiber'**
  String get ingredientDetailsNutrientsFiber;

  /// No description provided for @ingredientDetailsNutrientsProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get ingredientDetailsNutrientsProtein;

  /// No description provided for @ingredientDetailsNutrientsSalt.
  ///
  /// In en, this message translates to:
  /// **'Salt'**
  String get ingredientDetailsNutrientsSalt;

  /// No description provided for @ingredientDetailsNutrientDescriptionsUnit.
  ///
  /// In en, this message translates to:
  /// **'This metric is the reference quantity for which all of the nutritional facts mentioned is this list are based on. You can customise the different quantity options per food item on the settings page'**
  String get ingredientDetailsNutrientDescriptionsUnit;

  /// No description provided for @ingredientDetailsNutrientDescriptionsCalories.
  ///
  /// In en, this message translates to:
  /// **'Calories are a unit of measurement used to quantify the amount of energy that a particular food source provides when consumed and metabolized by the body. They represent the energy content of a food source and are used to estimate the potential impact of that food on an individual\'s energy balance and overall nutritional intake. In simple terms, consuming less, exact or more calories than the threshold required to sustain one\'s metabolic activity, will result in weight loss, sustain or increase respectively (primarily in the form of fat mass being stored or consumed in the body)'**
  String get ingredientDetailsNutrientDescriptionsCalories;

  /// No description provided for @ingredientDetailsNutrientDescriptionsProtein.
  ///
  /// In en, this message translates to:
  /// **'Proteins are essential macromolecules composed of amino acids. They play a crucial role in the structure, function, and regulation of cells and tissues in the body. Proteins are involved in various biological processes, including building and repairing tissues, supporting the immune system, acting as enzymes to facilitate chemical reactions, and serving as transporters for molecules within the body. Dietary sources of protein include meat, poultry, fish, dairy products, legumes, nuts, and certain grains.'**
  String get ingredientDetailsNutrientDescriptionsProtein;

  /// No description provided for @ingredientDetailsNutrientDescriptionsCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbohydrates, often referred to as carbs, are one of the three primary macronutrients found in food, along with proteins and fats. Carbohydrates are organic compounds composed of carbon, hydrogen, and oxygen atoms. They serve as a primary source of energy for the body, particularly for the brain and muscles. '**
  String get ingredientDetailsNutrientDescriptionsCarbs;

  /// No description provided for @ingredientDetailsNutrientDescriptionsSugars.
  ///
  /// In en, this message translates to:
  /// **'Sugars are simple carbohydrates that are naturally occurring or added to foods and beverages. They are composed of small molecules, such as glucose, fructose, and sucrose. Sugars are a source of quick energy for the body and are often naturally present in fruits, vegetables, and dairy products. However, when consumed in excessive amounts, added sugars from sources like sugary drinks, sweets, and processed foods can contribute to excess calorie intake and potentially negative health effects. It\'s important to limit sugar consumption (especially from products that contain added sugar) According to W.H.O sugar consumption should be limited to 10% of our daily calory intake.'**
  String get ingredientDetailsNutrientDescriptionsSugars;

  /// No description provided for @ingredientDetailsNutrientDescriptionsFat.
  ///
  /// In en, this message translates to:
  /// **'Fats, also known as lipids, are essential macronutrients that serve as a concentrated source of energy for the body. They play a crucial role in various physiological functions, including providing insulation, cushioning organs, and aiding in the absorption of fat-soluble vitamins (A, D, E, and K). Fats can be categorized into different types: saturated fats, unsaturated fats (monounsaturated and polyunsaturated), and trans fats. Unsaturated fats, found in foods like nuts, seeds, avocados, and certain oils, are generally considered healthier options compared to saturated fats and especially trans fats. While fats are necessary for a balanced diet, moderation is key, as excessive consumption of unhealthy fats can contribute to weight gain and various health issues.'**
  String get ingredientDetailsNutrientDescriptionsFat;

  /// No description provided for @ingredientDetailsNutrientDescriptionsSaturated.
  ///
  /// In en, this message translates to:
  /// **'Saturated fats are a type of dietary fat that are typically solid at room temperature. They are found primarily in animal-based foods and certain plant oils. Saturated fats and especially Trans fats have been associated with raising levels of LDL (low-density lipoprotein) cholesterol in the blood, which is often referred to as \'bad\' cholesterol. Elevated levels of LDL cholesterol are a risk factor for cardiovascular diseases. According to W.H.O. it is recommended to minimize saturated/trans fat consumption to no more than 6% of your total daily calory intake'**
  String get ingredientDetailsNutrientDescriptionsSaturated;

  /// No description provided for @ingredientDetailsNutrientDescriptionsFiber.
  ///
  /// In en, this message translates to:
  /// **'Dietary fiber is a type of carbohydrate that the body cannot fully digest or absorb. It\'s found in plant-based foods such as whole grains, fruits, vegetables, legumes, nuts, and seeds. It helps lower cholesterol levels and stabilize blood sugar levels by slowing down the digestion and absorption of carbohydrates. It promotes regular bowel movements and contributes in maintaining gut health. It also potentially reduces the risk of various chronic deceases. It\'s important to include a variety of fiber-rich foods in your diet to support the health benefits it provides'**
  String get ingredientDetailsNutrientDescriptionsFiber;

  /// No description provided for @ingredientDetailsNutrientDescriptionsSalt.
  ///
  /// In en, this message translates to:
  /// **'Salt, chemically known as sodium chloride, is a mineral that is commonly used as a seasoning to enhance the flavor of food. While salt adds taste to dishes, excessive consumption of sodium, a component of salt, can have negative effects on health. It\'s recommended to limit sodium intake by reducing the consumption of high-sodium processed foods (like packaged snacks, canned soups, and fast food) and using salt in moderation while cooking and at the table. Opting for herbs, spices, and other flavoring alternatives can help reduce reliance on salt for flavor enhancement.'**
  String get ingredientDetailsNutrientDescriptionsSalt;

  /// No description provided for @ingredientDetailsButtonSideActionsDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get ingredientDetailsButtonSideActionsDeleteButton;

  /// No description provided for @ingredientDetailsButtonSideActionsEditButton.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get ingredientDetailsButtonSideActionsEditButton;

  /// No description provided for @ingredientDetailsDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Required'**
  String get ingredientDetailsDeleteDialogTitle;

  /// No description provided for @ingredientDetailsDeleteDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you wish to delete this ingredient?'**
  String get ingredientDetailsDeleteDialogBody;

  /// No description provided for @ingredientDetailsDeleteDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get ingredientDetailsDeleteDialogCancel;

  /// No description provided for @ingredientDetailsDeleteDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get ingredientDetailsDeleteDialogConfirm;

  /// No description provided for @historicalPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Historical Analysis'**
  String get historicalPageTitle;

  /// No description provided for @profilePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profilePageTitle;

  /// No description provided for @profilePageHints0.
  ///
  /// In en, this message translates to:
  /// **'Your corresponding BMR Calories'**
  String get profilePageHints0;

  /// No description provided for @profilePageHints1.
  ///
  /// In en, this message translates to:
  /// **'Your targeted daily protein consumption'**
  String get profilePageHints1;

  /// No description provided for @profilePageHints2.
  ///
  /// In en, this message translates to:
  /// **'Your targeted daily diatery fiber consumption'**
  String get profilePageHints2;

  /// No description provided for @profilePageHints3.
  ///
  /// In en, this message translates to:
  /// **'Your targeted daily sugars limit'**
  String get profilePageHints3;

  /// No description provided for @profilePageHints4.
  ///
  /// In en, this message translates to:
  /// **'Your targeted daily saturated/trans fats limit'**
  String get profilePageHints4;

  /// No description provided for @profilePageHints5.
  ///
  /// In en, this message translates to:
  /// **'Your targeted daily salt limit'**
  String get profilePageHints5;

  /// No description provided for @profilePageHints6.
  ///
  /// In en, this message translates to:
  /// **'Your current weight (kg.)'**
  String get profilePageHints6;

  /// No description provided for @profilePageHints7.
  ///
  /// In en, this message translates to:
  /// **'Your current height (cm.)'**
  String get profilePageHints7;

  /// No description provided for @profilePageLabels0.
  ///
  /// In en, this message translates to:
  /// **'BMR Calories'**
  String get profilePageLabels0;

  /// No description provided for @profilePageLabels1.
  ///
  /// In en, this message translates to:
  /// **'Protein Target (gr.)'**
  String get profilePageLabels1;

  /// No description provided for @profilePageLabels2.
  ///
  /// In en, this message translates to:
  /// **'Diatery Fiber Targer (gr.)'**
  String get profilePageLabels2;

  /// No description provided for @profilePageLabels3.
  ///
  /// In en, this message translates to:
  /// **'Sugars Limit (%)'**
  String get profilePageLabels3;

  /// No description provided for @profilePageLabels4.
  ///
  /// In en, this message translates to:
  /// **'Saturated/Trans Limit (%)'**
  String get profilePageLabels4;

  /// No description provided for @profilePageLabels5.
  ///
  /// In en, this message translates to:
  /// **'Salt Limit (mg.)'**
  String get profilePageLabels5;

  /// No description provided for @profilePageLabels6.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg.)'**
  String get profilePageLabels6;

  /// No description provided for @profilePageLabels7.
  ///
  /// In en, this message translates to:
  /// **'Height (cm.)'**
  String get profilePageLabels7;

  /// No description provided for @profilePageButtonSideActionsSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profilePageButtonSideActionsSaveButton;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsPageTitle;

  /// No description provided for @overviewPageSurpassed.
  ///
  /// In en, this message translates to:
  /// **'Surpassed {title}'**
  String overviewPageSurpassed(String title);

  /// No description provided for @scannerPageClose.
  ///
  /// In en, this message translates to:
  /// **'Close Scanner'**
  String get scannerPageClose;

  /// No description provided for @archiveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Archive Day\'s Intake'**
  String get archiveDialogTitle;

  /// No description provided for @archiveDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Select the date that you wish your current intake to be registered to. Today\'s date is preselected by default. Press complete to finalise the registration process.'**
  String get archiveDialogBody;

  /// No description provided for @archiveDialogSelectedDate.
  ///
  /// In en, this message translates to:
  /// **'Selected Date'**
  String get archiveDialogSelectedDate;

  /// No description provided for @archiveDialogArchiveFor.
  ///
  /// In en, this message translates to:
  /// **'Archive For:'**
  String get archiveDialogArchiveFor;

  /// No description provided for @archiveDialogDateTaken.
  ///
  /// In en, this message translates to:
  /// **'Measurement already exists for the selected date. \'Complete\' will overwrite it.'**
  String get archiveDialogDateTaken;

  /// No description provided for @archiveDialogDateFree.
  ///
  /// In en, this message translates to:
  /// **'Selected Date has no previous Measurement assigned.'**
  String get archiveDialogDateFree;

  /// No description provided for @archiveDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get archiveDialogCancel;

  /// No description provided for @archiveDialogComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get archiveDialogComplete;

  /// No description provided for @snackbarProductFound.
  ///
  /// In en, this message translates to:
  /// **'Product found, its values have been filled in'**
  String get snackbarProductFound;

  /// No description provided for @snackbarProductNotFound.
  ///
  /// In en, this message translates to:
  /// **'No product found or there has been an error in the connection'**
  String get snackbarProductNotFound;

  /// No description provided for @snackbarClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get snackbarClose;

  /// No description provided for @settingsPageLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsPageLanguage;

  /// No description provided for @profilePageInvalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a number of 0 or more'**
  String get profilePageInvalidNumber;

  /// No description provided for @unitGramsShort.
  ///
  /// In en, this message translates to:
  /// **'gr.'**
  String get unitGramsShort;

  /// No description provided for @activityWalking.
  ///
  /// In en, this message translates to:
  /// **'Walking'**
  String get activityWalking;

  /// No description provided for @activityKilometers.
  ///
  /// In en, this message translates to:
  /// **'Kilometers'**
  String get activityKilometers;

  /// No description provided for @ingredientsPageUncategorised.
  ///
  /// In en, this message translates to:
  /// **'Uncategorised'**
  String get ingredientsPageUncategorised;

  /// No description provided for @ingredientsPageNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a product name'**
  String get ingredientsPageNameRequired;

  /// No description provided for @historyRangeWeek.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get historyRangeWeek;

  /// No description provided for @historyRangeMonth.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get historyRangeMonth;

  /// No description provided for @historyRangeAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get historyRangeAll;

  /// No description provided for @historyPageEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No archived days'**
  String get historyPageEmptyTitle;

  /// No description provided for @historyPageEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Archive a day from the Overview with the save button'**
  String get historyPageEmptySubtitle;

  /// No description provided for @historyPageLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'History could not be loaded'**
  String get historyPageLoadFailed;

  /// No description provided for @historyPageDaysLogged.
  ///
  /// In en, this message translates to:
  /// **'Days logged'**
  String get historyPageDaysLogged;

  /// No description provided for @historyPageAverageKcal.
  ///
  /// In en, this message translates to:
  /// **'Average kcal'**
  String get historyPageAverageKcal;

  /// No description provided for @historyPageKcalGoalMet.
  ///
  /// In en, this message translates to:
  /// **'Calorie goal met'**
  String get historyPageKcalGoalMet;

  /// No description provided for @historyPageStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get historyPageStreak;

  /// No description provided for @historyPageStreakDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String historyPageStreakDays(int count);

  /// No description provided for @historyPageAdherence.
  ///
  /// In en, this message translates to:
  /// **'Goal adherence'**
  String get historyPageAdherence;

  /// No description provided for @historyPageDaysMet.
  ///
  /// In en, this message translates to:
  /// **'{met} of {total, plural, =1{1 day} other{{total} days}}'**
  String historyPageDaysMet(int met, int total);

  /// No description provided for @historyPageDays.
  ///
  /// In en, this message translates to:
  /// **'Archived days'**
  String get historyPageDays;

  /// No description provided for @historyGoalEnergy.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get historyGoalEnergy;

  /// No description provided for @historyPageCaloriesChart.
  ///
  /// In en, this message translates to:
  /// **'Daily calories'**
  String get historyPageCaloriesChart;

  /// No description provided for @historyPageMacroSplit.
  ///
  /// In en, this message translates to:
  /// **'Average macro split'**
  String get historyPageMacroSplit;

  /// No description provided for @historyMacroCarbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get historyMacroCarbs;

  /// No description provided for @historyMacroFat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get historyMacroFat;

  /// No description provided for @historyDayNotFound.
  ///
  /// In en, this message translates to:
  /// **'This day is not archived'**
  String get historyDayNotFound;

  /// No description provided for @historyDayBurned.
  ///
  /// In en, this message translates to:
  /// **'Burned through activity: {kcal} kcal'**
  String historyDayBurned(int kcal);

  /// No description provided for @historyDayDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete day'**
  String get historyDayDelete;

  /// No description provided for @historyDayDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this day?'**
  String get historyDayDeleteTitle;

  /// No description provided for @historyDayDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Its archived intake will be removed from the history. This cannot be undone.'**
  String get historyDayDeleteBody;

  /// No description provided for @foodsPageIngredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get foodsPageIngredients;

  /// No description provided for @foodsPageRecipes.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get foodsPageRecipes;

  /// No description provided for @foodsPageNoRecipes.
  ///
  /// In en, this message translates to:
  /// **'No recipes yet'**
  String get foodsPageNoRecipes;

  /// No description provided for @foodsPageNoRecipesHint.
  ///
  /// In en, this message translates to:
  /// **'Build one from your ingredients'**
  String get foodsPageNoRecipesHint;

  /// No description provided for @recipeFormTitleAdd.
  ///
  /// In en, this message translates to:
  /// **'New Recipe'**
  String get recipeFormTitleAdd;

  /// No description provided for @recipeFormName.
  ///
  /// In en, this message translates to:
  /// **'Recipe Name'**
  String get recipeFormName;

  /// No description provided for @recipeFormNameHint.
  ///
  /// In en, this message translates to:
  /// **'Name of the recipe'**
  String get recipeFormNameHint;

  /// No description provided for @recipeFormNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter a recipe name'**
  String get recipeFormNameRequired;

  /// No description provided for @recipeFormAddIngredient.
  ///
  /// In en, this message translates to:
  /// **'Add ingredient'**
  String get recipeFormAddIngredient;

  /// No description provided for @recipeFormIngredientsRequired.
  ///
  /// In en, this message translates to:
  /// **'Add at least one ingredient with its grams'**
  String get recipeFormIngredientsRequired;

  /// No description provided for @recipeFormFinalWeight.
  ///
  /// In en, this message translates to:
  /// **'Final Weight (gr.)'**
  String get recipeFormFinalWeight;

  /// No description provided for @recipeFormFinalWeightHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to use the ingredients\' total'**
  String get recipeFormFinalWeightHint;

  /// No description provided for @recipeFormPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose an ingredient'**
  String get recipeFormPickerTitle;

  /// No description provided for @recipeTotalsPer100g.
  ///
  /// In en, this message translates to:
  /// **'Per 100 gr.'**
  String get recipeTotalsPer100g;

  /// No description provided for @recipeTotalsWeight.
  ///
  /// In en, this message translates to:
  /// **'{grams} gr. in total'**
  String recipeTotalsWeight(int grams);

  /// No description provided for @recipeFormTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit Recipe'**
  String get recipeFormTitleEdit;

  /// No description provided for @recipeDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recipe Details:'**
  String get recipeDetailsTitle;

  /// No description provided for @recipeDetailsWhole.
  ///
  /// In en, this message translates to:
  /// **'Whole recipe: {grams} gr., {kcal} kcal'**
  String recipeDetailsWhole(int grams, int kcal);

  /// No description provided for @recipeDetailsWholeCooked.
  ///
  /// In en, this message translates to:
  /// **'Whole recipe: {grams} gr. (ingredients {ingredientsGrams} gr.), {kcal} kcal'**
  String recipeDetailsWholeCooked(int grams, int ingredientsGrams, int kcal);

  /// No description provided for @recipeDetailsDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you wish to delete this recipe?'**
  String get recipeDetailsDeleteBody;

  /// No description provided for @ingredientDetailsDeleteDialogRecipes.
  ///
  /// In en, this message translates to:
  /// **'It will also be removed from these recipes: {recipes}'**
  String ingredientDetailsDeleteDialogRecipes(String recipes);

  /// No description provided for @profilePageSex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get profilePageSex;

  /// No description provided for @profilePageSexMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get profilePageSexMale;

  /// No description provided for @profilePageSexFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get profilePageSexFemale;

  /// No description provided for @profilePageBirthYear.
  ///
  /// In en, this message translates to:
  /// **'Birth year'**
  String get profilePageBirthYear;

  /// No description provided for @profilePageMicronutrientsHint.
  ///
  /// In en, this message translates to:
  /// **'Optional; used only for micronutrient reference values'**
  String get profilePageMicronutrientsHint;

  /// No description provided for @profilePageInvalidBirthYear.
  ///
  /// In en, this message translates to:
  /// **'Enter a year from 1900 to this year'**
  String get profilePageInvalidBirthYear;

  /// No description provided for @settingsPageTrackMicronutrients.
  ///
  /// In en, this message translates to:
  /// **'Track micronutrients'**
  String get settingsPageTrackMicronutrients;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['el', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
