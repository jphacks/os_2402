import 'dart:async';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final String overlayText;

  const Question({
    super.key,
    required this.overlayText,
  });

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  String _displayedText = '';  // 表示中のテキスト
  int _currentIndex = 0;  // 表示する文字のインデックス

  @override
  void initState() {
    super.initState();

    // アニメーションコントローラを初期化
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // スライドアニメーション
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // スケールアニメーション
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // アニメーションを開始
    _controller.forward();

    // 1秒遅らせてタイピングアニメーションを開始
    Future.delayed(const Duration(seconds: 1), _startTypingAnimation);
  }

  void _startTypingAnimation() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_currentIndex < widget.overlayText.length) {
        setState(() {
          _displayedText += widget.overlayText[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();  // 全ての文字が表示されたらタイマーを停止
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0, 20),
              child: Image.asset(
                'images/question.png',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Transform.translate(
                offset: const Offset(0, -6),
                child: Text(
                  _displayedText,  // 1文字ずつ表示されるテキスト
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
