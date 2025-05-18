import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUI extends StatefulWidget {
  // สร้างตัวแปรรับค่าที่จะส่งมา
  final double? carPrice;
  final double? payPermouth;
  final int? month;

  // สร้าง constructor มารอรับค่าทีี่ส่งมา
  ResultScreenUI({super.key, this.carPrice, this.payPermouth, this.month});

  @override
  State<ResultScreenUI> createState() => _ResultScreenUIState();
}

class _ResultScreenUIState extends State<ResultScreenUI> {
  @override
  Widget build(BuildContext context) {
    NumberFormat fm = NumberFormat("#,###,##0.00");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "CI Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ผ่อนทั้งหมด ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.month}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' เดือน',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'ค่างวดรถต่อเดือน',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${fm.format(widget.payPermouth)}',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'บาท',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
