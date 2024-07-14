import 'package:climate_app/mainApp/reusables/sized_box_hw.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              decoration: const InputDecoration(
                hintText: 'Search for a city',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          const Icon(Icons.search, color: primaryColor),
          sw20,
        ],
      ),
    );
  }
}
