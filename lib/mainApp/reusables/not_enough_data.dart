import 'package:flutter/material.dart';

import 'colors.dart';
import 'styles.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "No data found",
          style: smallTextWhite(),
        ),
      ),
    );
  }
}
