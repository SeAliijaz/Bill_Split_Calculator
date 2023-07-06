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

  /// Instruction Message for Persons Field
  static const String instruction = '''
  To split the bill among multiple persons, follow these steps:
  1. Enter the number of persons in the field provided.
  2. The corresponding fields for person names and amounts paid will appear.
  3. Fill in the details for each person, including their name and the amount they paid.
  4. Once all required fields are filled, the "Split Bill" button will be enabled.
  5. Click the "Split Bill" button to view the bill summary, including the split amounts for each person.
''';
}
