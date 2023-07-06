import 'package:flutter/material.dart';

///Reusable with title and form
class ReUsableFormField extends StatelessWidget {
  ///var
  final String? textTitle;
  final String? hintText;
  final IconData? prefixIcon;
  final bool? filled;
  final Color? fillColor;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  ///consts
  const ReUsableFormField({
    super.key,
    this.textTitle,
    this.hintText,
    this.prefixIcon,
    this.filled = false,
    this.fillColor,
    this.textEditingController,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ///Text
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              textTitle ?? "textTitle",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ///Sized Box
          SizedBox(height: 10),

          ///FormField
          Center(
            child: TextFormField(
              controller: textEditingController,
              validator: validator,
              decoration: InputDecoration(
                filled: filled,
                fillColor: fillColor,
                prefixIcon: Icon(prefixIcon ?? Icons.person_outline),
                hintText: hintText ?? "hintText",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: onChanged,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
