import 'package:bill_split_calculator/Models/split_data_model.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final List<SplitData> splitDataList;

  const SummaryScreen({Key? key, required this.splitDataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalBill = splitDataList.fold(
      0.0,
      (previousValue, splitData) => previousValue + splitData.splitAmount,
    );

    bool requiresPayment = totalBill >
        splitDataList.fold(
          0.0,
          (previousValue, splitData) => previousValue + splitData.amountPaid,
        );

    bool requiresChange = totalBill <
        splitDataList.fold(
          0.0,
          (previousValue, splitData) => previousValue + splitData.amountPaid,
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Summary'),
      ),
      body: ListView.separated(
        itemCount: splitDataList.length,
        itemBuilder: (context, index) {
          SplitData splitData = splitDataList[index];

          double change = splitData.amountPaid - splitData.splitAmount;
          bool requiresIndividualPayment = change < 0;
          String changeText = requiresIndividualPayment
              ? 'Pay Remaining: \$-${change.toStringAsFixed(2)}'
              : '';

          return ListTile(
            title: Text('Person ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${splitData.personName}'),
                Text(
                    'Amount Paid: \$${splitData.amountPaid.toStringAsFixed(2)}'),
                if (requiresIndividualPayment) Text(changeText),
              ],
            ),
            trailing: Text('Total Bill: \$${totalBill.toStringAsFixed(2)}'),
          );
        },
        separatorBuilder: (c, i) {
          return const Divider();
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Bill: \$${totalBill.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (requiresPayment) const Text('Payment Instructions:'),
            if (requiresPayment)
              const Text('- Collect remaining payment from customers.'),
            if (requiresChange) const Text('Change Instructions:'),
            if (requiresChange) const Text('- Give change back to customers.'),
            if (!requiresPayment && !requiresChange)
              const Text(
                  'Payment is equal to the total bill. No change or payment required.'),
          ],
        ),
      ),
    );
  }
}
