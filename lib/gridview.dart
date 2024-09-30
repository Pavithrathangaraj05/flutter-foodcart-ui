import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:project1/paymentpage.dart';
import 'package:project1/sales.dart';

class FoodCatalog extends StatefulWidget {
  const FoodCatalog({super.key});

  @override
  _FoodCatalogState createState() => _FoodCatalogState();
}

class _FoodCatalogState extends State<FoodCatalog> {
  List<dynamic> foodItems = [];
  List<String> categories = [
    'All',
    'Favourite',
    'Burger',
    'Sandwich',
    'Juice',
    'Pizza',
    'Tacos'
  ];
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/json.json');
    setState(() {
      foodItems = jsonDecode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[100], // Set body background color
          child: Column(
            children: [
              // Move AppBar content to the top of the body
              Container(
                color: Colors.grey[100], // AppBar-like background
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Catalog",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    Row(
                      children: [
                        PopupMenuButton<int>(
                          icon: const Icon(Icons.more_vert, color: Colors.black),
                          onSelected: (value) {
                            // Handle actions
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 1,
                              child: Text("Option 1"),
                            ),
                            const PopupMenuItem(
                              value: 2,
                              child: Text("Option 2"),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              // Horizontal scrollable category bar
              // Horizontal scrollable category bar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    bool isSelected = selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      child: ChoiceChip(
                        label: Row(
                          children: [
                            // if (category == 'Favourite' && isSelected) ...[
                            //   const SizedBox(width: 3),
                            //   const Icon(Icons.star_outline,
                            //       color:
                            //           Colors.white), // Star icon for "Favourite"
                            // ],
                            Text(category),
                          ],
                        ),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        selectedColor: const Color.fromARGB(255, 18, 46, 233),
                        backgroundColor: Colors.white,
                        // Remove tick icon by disabling the default elevation
                        showCheckmark:
                            false, // This removes the tick icon for all categories
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
        
              // Check if foodItems is empty, show a loading spinner if so
              foodItems.isEmpty
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: foodItems.length,
                          itemBuilder: (context, index) {
                            var foodItem = foodItems[index];
                            return FoodCard(
                              foodName: foodItem['foodName'],
                              image: foodItem['image'],
                              shortDescription: foodItem['shortDescription'],
                              noOfVarieties: foodItem['noOfVarieties'],
                              longDescription: foodItem['longDescription'],
                            );
                          },
                        ),
                      ),
                    ),
        
              // Add two buttons at the bottom with a 2:3 ratio
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(
                                  255, 18, 46, 233)), // Add border color
                          borderRadius: BorderRadius.circular(8),
                          // color:  Color.fromARGB(255, 18, 46, 233) // Add border radius
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Handle Print Bill action
                          },
                          icon: const Icon(
                            Icons.print,
                            color: Color.fromARGB(255, 18, 46, 233),
                          ),
                          label: const Text(
                            'Print Bill',
                            style: TextStyle(
                                color: Color.fromARGB(255, 18, 46, 233),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Match border radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          // border:
                          //     Border.all(color:Color.fromARGB(255, 18, 46, 233),), // Add border color
                          borderRadius:
                              BorderRadius.circular(8), // Add border radius
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Proceed Payment action
                          },
                          child: const Text(
                            'Proceed Payment',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 18, 46, 233),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Match border radius
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String foodName;
  final String image;
  final String shortDescription;
  final int noOfVarieties;
  final String longDescription;

  const FoodCard({
    required this.foodName,
    required this.image,
    required this.shortDescription,
    required this.noOfVarieties,
    required this.longDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      print("Error loading image: $error");
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error, color: Colors.red),
                            SizedBox(height: 5),
                            // Text(
                            //   "Image not available",
                            //   style: TextStyle(color: Colors.red),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      _showFoodDetails(context);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color.fromARGB(115, 92, 75, 75),
                      radius: 14,
                      child: Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  shortDescription,
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "$noOfVarieties variants",
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showFoodDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 220, // Adjust image height
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Close the modal
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                        child: Icon(Icons.close, size: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shortDescription,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '$noOfVarieties variants',
                          style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        const Spacer(),
                        const Text(
                          ' SAR 380.00',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                        ),
                        // New price
                        const Text(
                          'SAR 300.00',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // No. of varieties
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    // Long description
                    Text(
                      longDescription, // Make sure to provide the long description variable
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              // Calories and Food Type Row
              Divider(thickness: 1, color: Colors.grey[300]),
              Container(
                margin: EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Calories info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Calorie per 100g',
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                        Text(
                          '360 Kcal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    // Food type info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Food type',
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                        Text(
                          'Non-veg',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(), // Push the button to the bottom

              // Divider above the "Add item" button
              Divider(thickness: 1, color: Colors.grey[300]),

              // Add to Cart button
              Container(
                margin: EdgeInsets.all(8),
                child: SizedBox(
                  width: double.infinity, // Full width button
                  child: ElevatedButton(
                    onPressed: () {
                      _showVariantsAndAddOns(
                          context); // Call the function for the second modal
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 18, 46, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Add item",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

//   void _showVariantsAndAddOns(BuildContext context) async {
//   // Load JSON data from assets
//   String jsonString = await rootBundle.loadString('assets/json.json');
//   List<dynamic> foodItems = jsonDecode(jsonString);

//   int quantity = 2;
//   double itemTotal = 500.00;
//   String selectedVariant = "small"; // Initialize your selected variant
//   double pricePerItem = 200.00; // Set initial price for small

//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return Container(
//             padding: const EdgeInsets.all(16),
//             height: MediaQuery.of(context).size.height * 0.8,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "Variants & Add-ons",
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       icon: const Icon(Icons.close),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Expanded(
//                   child: ListView.builder(
//   itemCount: foodItems.length,
//   itemBuilder: (context, index) {
//     var foodItem = foodItems[index];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Image.network(
//                 foodItem["image"],
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     foodItem["foodName"],
//                     style: const TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     foodItem["shortDescription"],
//                     style: const TextStyle(fontSize: 14.0),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         Text(
//           "Varieties: ${foodItem["varieties"].join(', ')}",
//           style: const TextStyle(
//             fontSize: 14.0,
//             color: Colors.grey,
//           ),
//         ),
//         const Divider(),
//         // RadioListTile(
//         //   title: Text(foodItem["foodName"]),
//         //   value: foodItem["foodName"],
//         //   groupValue: selectedVariant, // Ensure this variable is defined in the state
//         //   onChanged: (value) {
//         //     setState(() {
//         //       selectedVariant = value!; // Update the selected variant
//         //       pricePerItem = foodItem["price"]; // Update the price based on the selected item
//         //       itemTotal = pricePerItem * quantity; // Recalculate item total
//         //     });
//         //   },
//         // ),
//       ],
//     );
//   },
// ),

//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                         ),
//                         child: const Text("Variants (2)"),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {},
//                         child: const Text("Add-ons"),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Quantity",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Column(
//                   children: [
//                     RadioListTile(
//                       title: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Pizza (Small)"),
//                           Text("SAR 200.00", style: TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                       value: "small",
//                       groupValue: selectedVariant,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedVariant = value!;
//                           pricePerItem = 200.00; // Update price for small
//                           itemTotal = pricePerItem * quantity; // Update total
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       title: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Pizza (Medium)"),
//                           Text("SAR 250.00", style: TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                       value: "medium",
//                       groupValue: selectedVariant,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedVariant = value!;
//                           pricePerItem = 250.00; // Update price for medium
//                           itemTotal = pricePerItem * quantity; // Update total
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       title: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Pizza (Large)"),
//                           Text("SAR 300.00", style: TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                       value: "large",
//                       groupValue: selectedVariant,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedVariant = value!;
//                           pricePerItem = 300.00; // Update price for large
//                           itemTotal = pricePerItem * quantity; // Update total
//                         });
//                       },
//                     ),
//                     const Divider(),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0), // Adjust the padding as needed
//                       child: Row(
//                         children: [
//                           const Text(
//                             "Item total",
//                             style: TextStyle(fontSize: 16.0),
//                           ),
//                           const Spacer(),
//                           Text(
//                             "${itemTotal.toStringAsFixed(2)} SAR",
//                             style: const TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blue), // Set your border color
//                             borderRadius: BorderRadius.circular(8), // Set your border radius
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   if (quantity > 1) {
//                                     setState(() {
//                                       quantity--;
//                                       itemTotal = pricePerItem * quantity; // Update total
//                                     });
//                                   }
//                                 },
//                                 icon: const Icon(Icons.remove),
//                                 color: Colors.blue,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 "$quantity",
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     quantity++;
//                                     itemTotal = pricePerItem * quantity; // Update total
//                                   });
//                                 },
//                                 icon: const Icon(Icons.add),
//                                 color: Colors.blue,
//                               ),
//                             ],
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => PaymentSummary()),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//                             backgroundColor: const Color.fromARGB(255, 18, 46, 233),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                           ),
//                           child: const Text(
//                             "Add to order",
//                             style: TextStyle(color: Colors.white, fontSize: 18.0),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
  void _showVariantsAndAddOns(BuildContext context) {
  int quantity = 2;
  double itemTotal = 500.00;
  String selectedVariant = "small"; // Initialize your selected variant
  double pricePerItem = 200.00; // Set initial price for small

  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.70,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Variants & Add-ons",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          image,
                          width: 65,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodName,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              shortDescription,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Colors.transparent,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 18, 46, 233),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 18, 46, 233),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Variants (2)",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(8),
                            ),
                            border: Border.all(color: const Color.fromARGB(255, 18, 46, 233)),
                          ),
                          child: Center(
                            child: Text(
                              "Add-ons",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 18, 46, 233),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Quantity",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      RadioListTile(
                        activeColor:  const Color.fromARGB(255, 18, 46, 233),
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pizza (Small)"),
                            Text("SAR 200.00", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        value: "small",
                        groupValue: selectedVariant,
                        onChanged: (value) {
                          setState(() {
                            selectedVariant = value!;
                            pricePerItem = 200.00; // Update price for small
                            itemTotal = pricePerItem * quantity; // Update total
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pizza (Medium)"),
                            Text("SAR 250.00", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        value: "medium",
                        groupValue: selectedVariant,
                        onChanged: (value) {
                          setState(() {
                            selectedVariant = value!;
                            pricePerItem = 250.00; // Update price for medium
                            itemTotal = pricePerItem * quantity; // Update total
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pizza (Large)"),
                            Text("SAR 300.00", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        value: "large",
                        groupValue: selectedVariant,
                        onChanged: (value) {
                          setState(() {
                            selectedVariant = value!;
                            pricePerItem = 300.00; // Update price for large
                            itemTotal = pricePerItem * quantity; // Update total
                          });
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  const Divider(),
                                  const Text(
                                    "Item total",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${itemTotal.toStringAsFixed(2)} SAR",
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 18, 46, 233),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                        itemTotal = pricePerItem * quantity; // Update total
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                  color: const Color.fromARGB(255, 18, 46, 233),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "$quantity",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                      itemTotal = pricePerItem * quantity; // Update total
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  color: const Color.fromARGB(255, 18, 46, 233),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Sales()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                              backgroundColor: const Color.fromARGB(255, 18, 46, 233),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              "Add to order",
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

}
