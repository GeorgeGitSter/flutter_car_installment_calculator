import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app/views/input_screen_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // Delay Display
    Future.delayed(
      // ระยะเวลา
      Duration(seconds: 3),
      // การทํางาน อันนี้คือย้อนกลับไม่ได้
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InputScreenUI(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img01.png",
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Car Installment \nCalculator",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreenAccent),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              child: CircularProgressIndicator(
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              "Created by GeorgeSter",
              style: TextStyle(
                fontSize: 16,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 16,
                color: Colors.lightGreenAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
