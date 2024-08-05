import 'package:flutter/material.dart';
import 'package:khusm/core/injection/injection_container.dart';
import 'package:khusm/features/main/main.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  initDependecies();
  await initFeaturesDependecies();
}
