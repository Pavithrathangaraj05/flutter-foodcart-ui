import 'package:flutter/material.dart';
import 'package:project1/gridview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/paymentpage.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 4, 110),
        title: const Row(
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Sales',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            BadgeNotification(count: 9),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2Zlc3Npb25hbHxlbnwwfHwwfHx8MA%3D%3D'),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(child: const salesSummary()),
    );
  }
}

class BadgeNotification extends StatelessWidget {
  final int count;
  const BadgeNotification({required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        const Icon(
          Icons.notifications_active_outlined,
          size: 30,
          color: Colors.white,
        ),
        if (count > 0)
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: Text(
              '$count',
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
      ],
    );
  }
}

class salesSummary extends StatefulWidget {
  const salesSummary({super.key});

  @override
  State<salesSummary> createState() => _salesSummaryState();
}

class _salesSummaryState extends State<salesSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for the TextField
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Colors.grey,
                          width: 0.5), // Border for the TextField
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.2), // Light shadow color
                          blurRadius: 4.0, // Soft shadow
                          offset: const Offset(0, 2), // Shadow offset
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        border: InputBorder.none, // Remove the default border
                        contentPadding: EdgeInsets.all(
                            12.0), // Padding inside the TextField
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FoodCatalog()), // Replace with your page
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.all(5), // Padding around the SVG icon
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color for the container
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Colors.grey,
                          width: 0.5), // Border color and width
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          8.0), // Ensure SVG is clipped within the border radius
                      child: SvgPicture.asset(
                        'assets/grid_icon.svg', // Replace with your SVG file path
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cart summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    // Wrapping the SVG icon in a Container with border and radius
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8.0), // Border radius
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/empty_cart.svg', // Replace with your SVG file path
                        height: 25,
                        width: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Wrapping the Icon in a Container with border and radius
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8.0), // Border radius
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "Order ID:  ",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "000001",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Icon(Icons.table_chart),
                SizedBox(width: 5),
                Text('Table 1   '),
                Icon(
                  Icons.circle,
                  size: 7,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Icon(Icons.person),
                SizedBox(width: 5),
                Text('Sam Richard    '),
                Icon(
                  Icons.circle,
                  size: 7,
                  color: Colors.grey,
                ),
                SizedBox(width: 20),
                Icon(Icons.person_outline),
                SizedBox(width: 5),
                Text('Mark'),
              ],
            ),
          ),
          // ]),
          //  Column(
          //   children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(4), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 2), // Offset of the shadow
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0), // Padding inside the container
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Item',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Qty & Amount (SAR)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView(
                children: [
                  const CartItem(
                    itemName: 'Pizza meal combo with vegetables paaty',
                    size: 'Small',
                    price: 250.00,
                    quantity: 2,
                  ),
                  const CartItem(
                    itemName: 'Chicken sandwich',
                    size: 'Small',
                    price: 100.00,
                    quantity: 4,
                    extra: 'Add ons: Extra cheese',
                  ),
                  CartItem(
                    itemName: 'Grape juice',
                    price: 33.00,
                    quantity: 2,
                    originalPrice: 35.00,
                    discountTag: '  Super  30 applied',
                  ),
                  const CartItem(
                    itemName: 'Chicken finger fries with burger',
                    price: 140.00,
                    quantity: 2,
                    extra: 'Add ons: Diet coke',
                  ),
                  // const CartItem(
                  //   itemName: 'Grape juice',
                  //   price: 33.00,
                  //   quantity: 2,
                  //   extra: 'Add ons: Diet coke',
                  // ),
                ],
              ),
            ),
          ),
          const CartSummaryFooter(itemCount: 8),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String itemName;
  final String? size;
  final double price;
  final int quantity;
  final double? originalPrice;
  final String? discountTag;
  final String? extra;

  const CartItem({
    required this.itemName,
    this.size,
    required this.price,
    required this.quantity,
    this.originalPrice,
    this.discountTag,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    if (size != null)
                      Text(size!, style: const TextStyle(color: Colors.grey)),
                    if (extra != null)
                      Text(extra!, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          padding:EdgeInsets.all(0) ,
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey,width: .5),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Decrement functionality
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text('$quantity'),
                              IconButton(
                                onPressed: () {
                                  // Increment functionality
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SAR ${price.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (originalPrice != null) ...[
                          Text(
                            'SAR ${originalPrice!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 10),
                          // if (discountTag != null)
                          //   Container(
                          //     padding: const EdgeInsets.all(4),
                          //     color: Colors.green.shade100,
                          //     child: Text(
                          //       discountTag!,
                          //       style: const TextStyle(color: Colors.green),
                          //     ),
                          //   ),
                        ],
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (discountTag != null)
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green[100]),
                padding: const EdgeInsets.all(8),
                // color: Colors.green.shade100,
                width: double.infinity, // Make the container full width
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.percent,color:Colors.black ,size: 20,),
                    Text(
                      discountTag!,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CartSummaryFooter extends StatelessWidget {
  final int itemCount;

  const CartSummaryFooter({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentSummary()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 18, 46, 233),
              padding: const EdgeInsets.all(16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items $itemCount',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const Row(
                  children: [
                    Text('View payment summary  ',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// // Placeholder for PaymentSummary class
// class PaymentSummary extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Payment Summary')),
//       body: const Center(child: Text('Payment summary details go here.')),
//     );
//   }
// }
