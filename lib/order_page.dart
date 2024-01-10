import 'package:flutter/material.dart';
import 'main.dart';

class OrderPage extends StatelessWidget {
  final MenuItem menuItem;

  OrderPage(this.menuItem);

  final TextEditingController amountPaidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดออเดอร์'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              menuItem.imagePath,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              menuItem.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ราคา: ฿${menuItem.price.toString()}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: amountPaidController,
              decoration: InputDecoration(
                labelText: 'ป้อนจำนวนเงินที่ลูกค้าจ่าย',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                double amountPaid =
                    double.tryParse(amountPaidController.text) ?? 0.0;

                if (amountPaid <= 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('แจ้งเตือน'),
                        content: Text('โปรดป้อนจำนวนเงินที่มากกว่า 0'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                        backgroundColor: Colors.red,
                      );
                    },
                  );
                } else if (amountPaid < menuItem.price) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('แจ้งเตือน'),
                        content: Text('จำนวนเงินที่จ่ายน้อยกว่าราคาอาหาร'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                        backgroundColor: Colors.red,
                      );
                    },
                  );
                } else {
                  double change = amountPaid - menuItem.price;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('ใบเสร็จ'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('ราคาอาหาร: ฿${menuItem.price.toString()}'),
                            Text(
                                'จำนวนเงินที่ลูกค้าจ่าย: ฿${amountPaid.toString()}'),
                            Text('เงินทอน: ฿${change.toStringAsFixed(2)}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                        backgroundColor: Colors.yellow,
                      );
                    },
                  );
                }
              },
              child: Text('คำนวณ'),
            ),
          ],
        ),
      ),
    );
  }
}
