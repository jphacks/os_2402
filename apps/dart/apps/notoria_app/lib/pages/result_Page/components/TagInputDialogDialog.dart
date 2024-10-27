import 'package:flutter/material.dart';

class TagInputDialog extends StatelessWidget {
  final Function(String) onTagAdded;

  const TagInputDialog({Key? key, required this.onTagAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTagAdded(newTag);
            }
            Navigator.of(context).pop();
          },
          child: Text("追加"),
        ),
      ],
    );
  }
}
