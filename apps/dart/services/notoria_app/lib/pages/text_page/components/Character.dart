import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  _Character createState() => _Character();
}

class _Character extends State<Character> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);  // 上下に繰り返すアニメーション

    _animation = Tween<double>(begin: -20.0, end: -10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,  // スムーズな上下動
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();  // アニメーションコントローラの破棄
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: child,
        );
      },
      child: Image.asset(
        'images/Character.png',
        width: 280.0,
        height: 214.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
