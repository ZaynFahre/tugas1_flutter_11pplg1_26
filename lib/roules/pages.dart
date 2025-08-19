import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/calculator_page.dart';
import 'package:latihan1/pages/football_edit_page.dart';
import 'package:latihan1/pages/football_page.dart';
import 'package:latihan1/roules/roules.dart';

class AppPages{
  // list / array yang isinya kumpulan page kita
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballeditplayers, page: () => FootballEditPage()),
    GetPage(name: AppRoutes.profile, page: () => Container()),
  ];
}