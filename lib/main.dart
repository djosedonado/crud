import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/controller/controllerArticles.dart';
import 'domain/controller/controllerUser.dart';
import 'ui/app.dart';

void main() {
  Get.put(ControlUser());
  Get.put(ControlArticles());
  runApp(const App());
}
