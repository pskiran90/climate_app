import 'package:climate_app/mainApp/reusables/colors.dart';
import 'package:climate_app/mainApp/reusables/styles.dart';
import 'package:flutter/material.dart';

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
