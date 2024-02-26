import 'package:flutter/material.dart';
import 'package:temp_mail/src/local/shared_preference_helper.dart';
import 'src/application.dart';
import 'src/di.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await LocalData.init();
  setupLocator();
  runApp(const Application());
}
