import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Summary',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 6, 4, 110),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Order ID: ',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          TextSpan(
                            text: '12345689',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person_outline, color: Colors.grey),
                        const SizedBox(width: 4),
                        const Text(
                          'Ashwin',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
          
                // Subtotal, Discount, Tax details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sub total',
                      style: TextStyle(fontSize: 16,color: Colors.grey),
                    ),
                    const Text(
                      'SAR 1050.00',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Discounts',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.delete_outline, color: Colors.grey, size: 18),
                      ],
                    ),
                    const Text(
                      '- SAR 50.00',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 11, 115, 14)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Taxable amount',
                      style: TextStyle(fontSize: 16,color: Colors.grey),
                    ),
                    const Text(
                      'SAR 900.00',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total tax',
                      style: TextStyle(fontSize: 16,color:Colors.grey),
                    ),
                    const Text(
                      'SAR 40.00',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  ],
                ),
                const Divider(height: 30),
          
                // Grand total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Grand total',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      'SAR 940.00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
          
                Spacer(),
                Divider(),
                // Add notes section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.note_add_outlined, color: Colors.black),
                    const SizedBox(width: 5),
                    const Text(
                      'Add notes',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Divider(),
          // ,            const Spacer(),
          
                // Buttons at the bottom
          
                // Additional buttons (Customer, Coupon, Discount)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black), // Add border color
                          borderRadius:
                              BorderRadius.circular(8), // Add border radius
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Handle Customer action
                          },
                          icon: const Icon(Icons.person_outline,color: Colors.black,size: 20,),
                          label: const Text('Customer',style: TextStyle(color: Colors.black,),),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Match border radius
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Handle Coupon action
                          },
                          icon: const Icon(Icons.card_giftcard_outlined,color: Colors.black,size:20,),
                          label: const Text('Coupon',style: TextStyle(color: Colors.black)),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Handle Discount action
                          },
                          icon: const Icon(Icons.percent,color: Colors.black,size:20),
                          label: const Text('Discount',style: TextStyle(color: Colors.black)),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color.fromARGB(255, 18, 46, 233)), // Add border color
                          borderRadius:
                              BorderRadius.circular(8),
                              // color:  Color.fromARGB(255, 18, 46, 233) // Add border radius
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Handle Print Bill action
                          },
                          icon: const Icon(Icons.print,color:  Color.fromARGB(255, 18, 46, 233),),
                          label: const Text('Print Bill',style: TextStyle(color: Color.fromARGB(255, 18, 46, 233),fontWeight: FontWeight.bold),),
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
                          child: const Text('Proceed Payment',style: TextStyle(color:Colors.white),),
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
