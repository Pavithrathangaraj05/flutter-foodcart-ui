import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/gridview.dart';
import 'package:project1/paymentpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 4, 110),
          title: Row(
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
        ),
        body: SafeArea(child: CartSummary()),
      ),
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
        Icon(
          Icons.notifications,
          size: 30,
          color: Colors.white,
        ),
        if (count > 0)
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: Text(
              '$count',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
      ],
    );
  }
}

class CartSummary extends StatelessWidget {
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
                          offset: Offset(0, 2), // Shadow offset
                        ),
                      ],
                    ),
                    child: TextField(
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
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FoodCatalog()), // Replace with your page
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(5), // Padding around the SVG icon
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
                Text(
                  'Cart summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    // Wrapping the SVG icon in a Container with border and radius
                    Container(
                      padding: EdgeInsets.all(8),
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
                    SizedBox(width: 10),
                    // Wrapping the Icon in a Container with border and radius
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8.0), // Border radius
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
                    offset: Offset(0, 2), // Offset of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(8.0), // Padding inside the container
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
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/empty_cart.svg', // Replace with your SVG file path
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Cart is empty',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('Scan barcode or add items from catalog'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
