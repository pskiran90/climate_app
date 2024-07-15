import 'package:flutter/material.dart';
import 'colors.dart';
import 'sized_box_hw.dart';

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
              style: const TextStyle(color: black),
              decoration: const InputDecoration(
                hintText: 'Search for a city',
                hintStyle: TextStyle(color: grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
            ),
          ),
          const Icon(Icons.search, color: primaryColor),
          sw20
        ],
      ),
    );
  }
}
