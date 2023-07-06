import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const ActionButton({
    this.text,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.blue,
      height: 65.5,
      onPressed: onPressed,
      child: Text(
        text ?? "text",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
