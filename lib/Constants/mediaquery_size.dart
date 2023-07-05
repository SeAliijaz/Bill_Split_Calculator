import 'package:flutter/material.dart';

///Assigning mediaQuery variable to use globally
class MediaQuerySize {
  BuildContext context;

  /// MediaQuerySize(this.context) : assert(context != null);
  MediaQuerySize(this.context);

  /// MediaQuery.of(context).size.height;
  double get height => MediaQuery.of(context).size.height;

  /// MediaQuery.of(context).size.width;
  double get width => MediaQuery.of(context).size.width;
}
