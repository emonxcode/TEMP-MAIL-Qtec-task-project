import 'package:flutter/material.dart';
import 'package:temp_mail/src/local/shared_preference_helper.dart';
import 'src/application.dart';
import 'src/di.dart';
import 'src/local/sqflite_db_helper.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await LocalData.init();
  await SqfliteDatabaseHelper().initDB();
  setupLocator();
  runApp(const Application());
}
