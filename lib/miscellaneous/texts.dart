//! Create Category
String kCreateNewCategoryText =
    'Enter the name of the category that you wish to create, '
    'categories act as grouped entities of ingredients that you use for your meals (ex. cheese, meat, vegetables et.c.)';

//! Profile
List<String> profileTextfieldHints = [
  'Your corresponding BMR Calories',
  'Your targeted daily protein consumption',
  'Your targeted daily diatery fiber consumption',
  'Your targeted daily sugars limit',
  'Your targeted daily saturated/trans fats limit',
  'Your targeted daily salt limit',
  'Your current weight (kg.) ',
  'Your current height (cm.)',
];

List<String> profileTextfieldLabels = [
  'BMR Calories',
  'Protein Target (gr.)',
  'Diatery Fiber Targer (gr.)',
  'Sugars Limit (%)',
  'Saturated/Trans Limit (%)',
  'Salt Limit (mg.)',
  'Weight (kg.)',
  'Height (cm.)',
];

//! Add Ingredient
List<String> addIngredientTextfieldHints = [
  'Reference quantity for metrics',
  'Name of the ingredient',
  'Name of category',
  'Total amount of Calories (Kcal.)',
  'Total amount of Fats (gr.)',
  'Specific amount of saturated/trans Fats (gr.)',
  'Total amount of Carbohydrates (gr.)',
  'Specific amount of Simple Carbs/Sugars (gr.)',
  'Total amount of Dietary Fiber (gr.)',
  'Total amount of Protein (gr.)',
  'Total amount of salt (mg.)',
];

List<String> addIngredientTextfieldLabels = [
  'Reference Quantity',
  'Ingrident Name',
  'Ingredient Category',
  'Calories',
  'Total Fat',
  'Saturated/Trans Fat',
  'Total Carbohydrates',
  'Sugars',
  'Dietary Fiber',
  'Protein',
  'Salt',
];

//! Macronutrient Descriptions
String kPerDescription =
    'This metric is the reference quantity for which all of the nutritional facts mentioned is this list are based on. You can customise the different quantity options per food item on the settings page';
String kCaloriesDescription =
    'Calories are a unit of measurement used to quantify the amount of energy that a particular food source provides when consumed and metabolized by the body. They represent the energy content of a food source and are used to estimate the potential impact of that food on an individual\'s energy balance and overall nutritional intake. In simple terms, consuming less, exact or more calories than the threshold required to sustain one\'s metabolic activity, will result in weight loss, sustain or increase respectively (primarily in the form of fat mass being stored or consumed in the body)';
String kProteinsDescription =
    'Proteins are essential macromolecules composed of amino acids. They play a crucial role in the structure, function, and regulation of cells and tissues in the body. Proteins are involved in various biological processes, including building and repairing tissues, supporting the immune system, acting as enzymes to facilitate chemical reactions, and serving as transporters for molecules within the body. Dietary sources of protein include meat, poultry, fish, dairy products, legumes, nuts, and certain grains.';
String kCarbsDescription =
    'Carbohydrates, often referred to as carbs, are one of the three primary macronutrients found in food, along with proteins and fats. Carbohydrates are organic compounds composed of carbon, hydrogen, and oxygen atoms. They serve as a primary source of energy for the body, particularly for the brain and muscles. ';
String kSugarsDescription =
    'Sugars are simple carbohydrates that are naturally occurring or added to foods and beverages. They are composed of small molecules, such as glucose, fructose, and sucrose. Sugars are a source of quick energy for the body and are often naturally present in fruits, vegetables, and dairy products. However, when consumed in excessive amounts, added sugars from sources like sugary drinks, sweets, and processed foods can contribute to excess calorie intake and potentially negative health effects. It\'s important to limit sugar consumption (especially from products that contain added sugar) According to W.H.O sugar consumption should be limited to 10% of our daily calory intake.';
String kFatsDecription =
    'Fats, also known as lipids, are essential macronutrients that serve as a concentrated source of energy for the body. They play a crucial role in various physiological functions, including providing insulation, cushioning organs, and aiding in the absorption of fat-soluble vitamins (A, D, E, and K). Fats can be categorized into different types: saturated fats, unsaturated fats (monounsaturated and polyunsaturated), and trans fats. Unsaturated fats, found in foods like nuts, seeds, avocados, and certain oils, are generally considered healthier options compared to saturated fats and especially trans fats. While fats are necessary for a balanced diet, moderation is key, as excessive consumption of unhealthy fats can contribute to weight gain and various health issues.';
String kSaturatedDescription =
    'Saturated fats are a type of dietary fat that are typically solid at room temperature. They are found primarily in animal-based foods and certain plant oils. Saturated fats and especially Trans fats have been associated with raising levels of LDL (low-density lipoprotein) cholesterol in the blood, which is often referred to as "bad" cholesterol. Elevated levels of LDL cholesterol are a risk factor for cardiovascular diseases. According to W.H.O. it is recommended to minimize saturated/trans fat consumption to no more than 6% of your total daily calory intake';
String kDiateryFiberDescription =
    'Dietary fiber is a type of carbohydrate that the body cannot fully digest or absorb. It\'s found in plant-based foods such as whole grains, fruits, vegetables, legumes, nuts, and seeds. It helps lower cholesterol levels and stabilize blood sugar levels by slowing down the digestion and absorption of carbohydrates. It promotes regular bowel movements and contributes in maintaining gut health. It also potentially reduces the risk of various chronic deceases. It\'s important to include a variety of fiber-rich foods in your diet to support the health benefits it provides';
String kSaltDescription =
    'Salt, chemically known as sodium chloride, is a mineral that is commonly used as a seasoning to enhance the flavor of food. While salt adds taste to dishes, excessive consumption of sodium, a component of salt, can have negative effects on health. It\'s recommended to limit sodium intake by reducing the consumption of high-sodium processed foods (like packaged snacks, canned soups, and fast food) and using salt in moderation while cooking and at the table. Opting for herbs, spices, and other flavoring alternatives can help reduce reliance on salt for flavor enhancement.';

enum HealthEffects { benefitial, neutral, hazardous }
