import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;
  final double? height;

  BasicAppButton({
    super.key,
    required this.onpressed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        title,
        style:const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
