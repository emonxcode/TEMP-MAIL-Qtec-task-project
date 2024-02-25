import 'package:flutter/material.dart';
import 'src/app.dart';
import 'src/di.dart';

void main() {
  setupLocator();
  runApp(const Application());
}
