import 'package:flutter/material.dart';
import 'src/application.dart';
import 'src/di.dart';

void main() {
  setupLocator();
  runApp(const Application());
}
