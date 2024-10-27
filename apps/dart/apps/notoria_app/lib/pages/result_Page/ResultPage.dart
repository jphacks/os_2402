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
              title: "大江戸温泉",
              content: "今日は友達と大江戸温泉に行ってきた。入り口から江戸の雰囲気が漂っていて、浴衣に着替えると、すっかりタイムスリップした気分になる。温泉街を模したエリアには屋台風のお店が並び、たこ焼きや綿菓子を楽しみながら歩き回った。少し小腹を満たした後、いざ大浴場へ！広々とした大浴場には様々な湯船があり、露天風呂では竹林の景色を眺めながら、心も体もリラックス。湯気に包まれ、日常の疲れがスーッと抜けていく感じが心地よかった。温泉を満喫した後は、畳のリラックスルームで軽く昼寝。足湯にも浸かり、のんびりとした時間を堪能した。贅沢に過ごせたおかげで、心も体もリフレッシュできた気がする。また機会があれば、ぜひ訪れたい。",
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
