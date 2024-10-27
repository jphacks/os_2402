import 'package:flutter/material.dart';
import 'components/DiaryCard.dart';
import 'components/TagInputDialogDialog.dart';
import 'components/PhotoItem.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> _tags = []; // タグリストを管理
  List<bool> _isCheckedList = [true, true, true]; // 各画像のチェック状態を管理するリスト
  bool _isLoading = true; // ローディング状態を管理

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _showTagInputDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return TagInputDialog(
          onTagAdded: (newTag) {
            setState(() {
              _tags.add(newTag);
            });
          },
        );
      },
    );
  }

  void _toggleCheck(int index) {
    setState(() {
      _isCheckedList[index] = !_isCheckedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4EC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiaryCard(
              title: "日記のタイトル",
              content: "ここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れるここの生成された日記を入れる",
              onAddTap: _showTagInputDialog,
            ),
            const SizedBox(height: 20),

            _isLoading
              ? const CircularProgressIndicator()
              : SizedBox(
                width: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_isCheckedList.length, (index) {
                        return PhotoItem(
                          imagePath: 'images/photograph${index + 1}.jpg',
                          isChecked: _isCheckedList[index],
                          onTap: () => _toggleCheck(index),
                        );
                      }),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
