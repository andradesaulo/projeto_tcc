import 'package:flutter/material.dart';
import 'package:projeto_tcc/app_widget.dart';
import 'package:projeto_tcc/database/databasehelper.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.instance.delDatabase();
  runApp(AppWidget());
}