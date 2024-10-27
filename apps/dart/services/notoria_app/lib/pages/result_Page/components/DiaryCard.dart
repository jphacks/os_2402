import 'package:flutter/material.dart';

class DiaryCard extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onAddTap;

  const DiaryCard({
    Key? key,
    required this.title,
    required this.content,
    required this.onAddTap,
  }) : super(key: key);

  @override
  _DiaryCardState createState() => _DiaryCardState();
}

class _DiaryCardState extends State<DiaryCard> {
  List<String> _tags = [];

  void _addTag() {
    showDialog(
      context: context,
      builder: (context) {
        String newTag = "";
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text("タグを追加"),
          ),
          content: TextField(
            onChanged: (value) {
              newTag = value;
            },
            decoration: InputDecoration(hintText: "タグを入力"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("キャンセル"),
            ),
            TextButton(
              onPressed: () {
                if (newTag.isNotEmpty) {
                  setState(() {
                    _tags.add(newTag);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text("追加"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 450,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 4),
          const Divider(color: Colors.black26),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              30,
              (index) => Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _tags.map((tag) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('images/tag.png'),
                            Positioned(
                              top: 2,
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              InkWell(
                onTap: _addTag,
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
