import 'package:flutter/material.dart';
import 'menu_items.dart';
import 'Order_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ร้านอาหารโบราณ',
      theme: ThemeData(
        primarySwatch: Colors.brown, // เปลี่ยน primarySwatch เป็นสีน้ำตาล
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BrownYellowCardList(menuItems: menuItems),
    );
  }
}

class BrownYellowCardList extends StatelessWidget {
  final List<MenuItem> menuItems;

  BrownYellowCardList({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ร้านนารีอาหารโบราณ',
          style: TextStyle(
            color: Colors.white, // เปลี่ยนสีของตัวหนังสือใน AppBar เป็นสีขาว
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown, // เปลี่ยนสีของ AppBar เป็นสีน้ำตาล
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: menuItems.map((menu) {
          return BrownYellowCard(menu);
        }).toList(),
      ),
    );
  }
}

class BrownYellowCard extends StatelessWidget {
  final MenuItem menuItem;

  BrownYellowCard(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderPage(menuItem),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.amber, Colors.brown], // เปลี่ยนสี gradient เป็นน้ำตาลเหลือง
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                child: Image.asset(
                  menuItem.imagePath,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  menuItem.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'ราคา: \฿${menuItem.price.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String imagePath;
  final String name;
  final double price;

  MenuItem(this.imagePath, this.name, this.price);
}
