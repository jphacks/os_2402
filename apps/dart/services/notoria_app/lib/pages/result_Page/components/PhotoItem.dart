import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imagePath;
  final bool isChecked;
  final VoidCallback onTap;

  const PhotoItem({
    Key? key,
    required this.imagePath,
    required this.isChecked,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Opacity(
                opacity: isChecked ? 1.0 : 0.5,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
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
