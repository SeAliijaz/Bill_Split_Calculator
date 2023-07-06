import 'package:flutter/material.dart';

class AppConstants {
  ///Custom Dialog To Show Message
  static showDialogMessage(
    final BuildContext context,
    final String titleText,
    final String errorMessage,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  ///Custom Dialog To Show Message
  static showBottomSheetMessage(
    final BuildContext context,
    final String titleText,
    final String errorMessage,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Text Heading
              Text(
                titleText,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///SizedBox
              SizedBox(height: 5.0),

              ///Error Message
              Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),

              ///SizedBox
              SizedBox(height: 5.0),

              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
