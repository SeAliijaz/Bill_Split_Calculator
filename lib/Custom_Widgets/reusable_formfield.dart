import 'package:bill_split_calculator/Constants/constants.dart';
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
  final bool isInstructionNeeded;

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
    this.isInstructionNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ///Text
          Align(
            alignment: Alignment.centerLeft,
            child: isInstructionNeeded == false
                ? Text(
                    textTitle ?? "textTitle",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.5,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textTitle ?? "textTitle",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          AppConstants.showDialogMessage(
                              context,
                              "How to Use this Field?",
                              AppConstants.instruction);
                        },
                        icon: Icon(Icons.info_outline),
                      ),
                    ],
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
