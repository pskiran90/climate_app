import 'package:flutter/material.dart';

import '../../../reusables/colors.dart';
import '../../../reusables/sized_box_hw.dart';

class CityCard extends StatelessWidget {
  final String city;
  final void Function()? onTap;
  const CityCard({
    super.key,
    required this.city,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 5,
        child: Center(
          child: Row(
            children: [
              sw5,
              const Icon(
                Icons.location_city,
                color: grey,
                size: 16,
              ),
              sw10,
              Expanded(
                child: Text(
                  city,
                  style: const TextStyle(
                    fontSize: 12,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
