import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
