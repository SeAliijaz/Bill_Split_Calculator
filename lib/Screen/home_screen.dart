import 'package:bill_split_calculator/Custom_Widgets/action_button.dart';
import 'package:bill_split_calculator/Custom_Widgets/reusable_formfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double tipPercentage = 0.0;
  double discountPercentage = 0.0;
  int numberOfPersons = 1;

  TextEditingController billController = TextEditingController();
  List<TextEditingController> personNameControllers = [];

  @override
  void initState() {
    super.initState();
    personNameControllers =
        List.generate(numberOfPersons, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in personNameControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void updateNumberOfPersons(int value) {
    setState(() {
      numberOfPersons = value;
      personNameControllers =
          List.generate(value, (_) => TextEditingController());
    });
  }

  bool validateFields() {
    if (billController.text.isEmpty) return false;
    if (numberOfPersons < 1) return false;
    for (var controller in personNameControllers) {
      if (controller.text.isEmpty) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Split Calculator'),
      ),
      bottomNavigationBar: Container(
        child: ActionButton(
          text: validateFields()
              ? "Split Bill"
              : "Please fill all required fields",
          onPressed: validateFields() ? splitBill : null,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ReUsableFormField(
              textTitle: 'Bill Amount',
              hintText: 'Enter the bill amount',
              prefixIcon: Icons.attach_money,
              filled: true,
              fillColor: Colors.grey[200],
              textEditingController: billController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the bill amount';
                }
                return null;
              },
            ),
            ReUsableFormField(
              textTitle: 'Discount',
              hintText: 'Enter the discount',
              prefixIcon: Icons.local_offer,
              filled: true,
              fillColor: Colors.grey[200],
              textEditingController: TextEditingController(),
              validator: (value) {
                return null;
              },
            ),
            ReUsableFormField(
              textTitle: 'Number of Persons',
              hintText: 'Enter the number of persons',
              prefixIcon: Icons.person,
              filled: true,
              fillColor: Colors.grey[200],
              textEditingController: TextEditingController(),
              onChanged: (value) {
                int numberOfPersons = int.tryParse(value) ?? 0;
                updateNumberOfPersons(numberOfPersons);
              },
              validator: (value) {
                return null;
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: numberOfPersons,
              itemBuilder: (context, index) {
                return ReUsableFormField(
                  textTitle: 'Person ${index + 1} Name',
                  hintText: 'Enter the name of person ${index + 1}',
                  prefixIcon: Icons.person,
                  filled: true,
                  fillColor: Colors.grey[200],
                  textEditingController: personNameControllers[index],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name of person ${index + 1}';
                    }
                    return null;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double calculateTipAmount() {
    double totalBill = 0;
    try {
      totalBill = double.parse(billController.text);
    } catch (e) {
      print('Invalid bill amount');
    }
    double tipAmount = totalBill * (tipPercentage / 100);
    return tipAmount;
  }

  double calculateDiscountAmount() {
    double totalBill = 0;
    try {
      totalBill = double.parse(billController.text);
    } catch (e) {
      print('Invalid bill amount');
    }
    double discountAmount = totalBill * (discountPercentage / 100);
    return discountAmount;
  }

  double calculateFinalBill() {
    double totalBill = 0;
    try {
      totalBill = double.parse(billController.text);
    } catch (e) {
      print('Invalid bill amount');
    }
    double tipAmount = calculateTipAmount();
    double discountAmount = calculateDiscountAmount();
    double finalBill = totalBill - discountAmount + tipAmount;
    return finalBill;
  }

  double calculateSplitAmount() {
    double finalBill = 0;
    try {
      finalBill = calculateFinalBill();
    } catch (e) {
      print('Error calculating the final bill');
    }
    double splitAmount = finalBill / numberOfPersons;
    return splitAmount;
  }

  void splitBill() {
    double splitAmount = calculateSplitAmount();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Split Bill'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < numberOfPersons; i++)
                Text(
                  '${personNameControllers[i].text}: \$${splitAmount.toStringAsFixed(2)}',
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
