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
  int maxNumberOfPersons = 100;

  TextEditingController billController = TextEditingController();
  TextEditingController deliveryChargesController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  List<TextEditingController> personNameControllers = [];

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    personNameControllers =
        List.generate(numberOfPersons, (_) => TextEditingController());
  }

  @override
  void dispose() {
    billController.dispose();
    deliveryChargesController.dispose();
    discountController.dispose();
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
    updateButtonState();
  }

  bool areFieldsFilled() {
    if (billController.text.isEmpty ||
        deliveryChargesController.text.isEmpty ||
        discountController.text.isEmpty ||
        personNameControllers.any((controller) => controller.text.isEmpty)) {
      return false;
    }
    return true;
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = areFieldsFilled();
    });
  }

  void splitBill() {
    if (areFieldsFilled()) {
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
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Validation Error'),
            content: const Text('Please fill all required fields.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Split Calculator'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        child: ElevatedButton(
          onPressed: isButtonEnabled ? splitBill : null,
          child: Text('Split Bill'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
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
              onChanged: (value) {
                updateButtonState();
              },
            ),
            ReUsableFormField(
              textTitle: 'Delivery Charges',
              hintText: 'Enter the delivery charges',
              prefixIcon: Icons.local_shipping,
              filled: true,
              fillColor: Colors.grey[200],
              textEditingController: deliveryChargesController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the delivery charges';
                }
                return null;
              },
              onChanged: (value) {
                updateButtonState();
              },
            ),
            ReUsableFormField(
              textTitle: 'Discount',
              hintText: 'Enter the discount',
              prefixIcon: Icons.local_offer,
              filled: true,
              fillColor: Colors.grey[200],
              textEditingController: discountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the discount';
                }
                return null;
              },
              onChanged: (value) {
                updateButtonState();
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
                  onChanged: (value) {
                    updateButtonState();
                  },
                  validator: (value) {
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

  double calculateSplitAmount() {
    double totalBill = double.tryParse(billController.text) ?? 0.0;
    double deliveryCharges =
        double.tryParse(deliveryChargesController.text) ?? 0.0;
    double discount = double.tryParse(discountController.text) ?? 0.0;
    double finalBill = calculateFinalBill(totalBill, deliveryCharges, discount);
    double splitAmount = finalBill / numberOfPersons;
    return splitAmount;
  }

  double calculateFinalBill(
      double totalBill, double deliveryCharges, double discount) {
    double tipAmount = totalBill * (tipPercentage / 100);
    double finalBill = totalBill + deliveryCharges - discount + tipAmount;
    return finalBill;
  }
}
