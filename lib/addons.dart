import 'package:flutter/material.dart';
import 'package:project1/paymentpage.dart';

class VariantsAndAddOns extends StatefulWidget {
  @override
  _VariantsAndAddOnsState createState() => _VariantsAndAddOnsState();
}

class _VariantsAndAddOnsState extends State<VariantsAndAddOns> {
  String selectedVariant = "large"; // Default selected variant
  int quantity = 2; // Default quantity
  double pricePerItem = 300.00; // Default price for the "large" variant
  double itemTotal = 300.00 * 2; // Default item total

  void _showVariantsAndAddOns(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Variants & Add-ons",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Display image and short description
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://example.com/your-image.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pizza meal combo with grated cheese and vegetables Paaty",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Grated cheese and veggies pizza",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Tabs for variants and add-ons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Variants (2)"),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Add-ons"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Quantity and variants list
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
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pizza (Small)"),
                        Text("SAR 200.00",
                            style: TextStyle(color: Colors.grey)),
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
                        Text("SAR 250.00",
                            style: TextStyle(color: Colors.grey)),
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
                        Text("SAR 300.00",
                            style: TextStyle(color: Colors.grey)),
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
                ],
              ),
              const Spacer(),
              // Item total and Add to order button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Item total",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        "${itemTotal.toStringAsFixed(2)} SAR",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Quantity control
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                                itemTotal =
                                    pricePerItem * quantity; // Update total
                              });
                            }
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "$quantity",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                              itemTotal =
                                  pricePerItem * quantity; // Update total
                            });
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle add to order logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentSummary()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      backgroundColor: Color.fromARGB(255, 212, 18, 233),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Add to order",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showVariantsAndAddOns(context),
        child: const Text("Show Variants & Add-ons"),
      ),
    );
  }
}
