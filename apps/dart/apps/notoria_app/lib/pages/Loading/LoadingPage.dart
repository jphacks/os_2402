import 'package:flutter/material.dart';
import './resultPage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // 4秒後にResultPageに遷移
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResultPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4EC),
      body: Stack(
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Text(
              "loading...",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff008299),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),  // シャドウの位置
                    blurRadius: 3.0,           // シャドウのぼかし
                    color: Colors.black26,     // シャドウの色
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
