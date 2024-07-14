import 'package:flutter/material.dart';

class GlobalNotifier {
  // Singleton instance
  static final GlobalNotifier _instance = GlobalNotifier._internal();

  // Private constructor
  GlobalNotifier._internal();

  // Factory constructor
  factory GlobalNotifier() => _instance;

  // The global ValueNotifier
  final ValueNotifier<String> cityName = ValueNotifier<String>("");
}
