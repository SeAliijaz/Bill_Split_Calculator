class CalculatorFormulas {
  static double calculateTipAmount(
    double totalBill,
    double tipPercentage,
  ) {
    double tipAmount = totalBill * (tipPercentage / 100);
    return tipAmount;
  }

  static double calculateDiscountAmount(
    double totalBill,
    double discountPercentage,
  ) {
    double discountAmount = totalBill * (discountPercentage / 100);
    return discountAmount;
  }

  ///Calculation to Split Amount By Persons
  static double calculateFinalBill(
    double totalBill,
    double tipAmount,
    double discountAmount,
  ) {
    double finalBill = totalBill - discountAmount + tipAmount;
    return finalBill;
  }

  ///Calculation to Split Amount By Persons
  static double calculateSplitAmount(
    double finalBill,
    int numberOfPersons,
  ) {
    double splitAmount = finalBill / numberOfPersons;
    return splitAmount;
  }
}
