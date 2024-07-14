import 'package:flutter/material.dart';

import 'colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
  });
  final String title;
  final void Function()? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 50,
        width: size.width - 18,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 16 * 1.5,
              vertical: 16 / 2,
            ),
            backgroundColor: white,
            side: const BorderSide(
              color: primaryColor,
            ),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(color: black),
          ),
        ),
      ),
    );
  }
}
