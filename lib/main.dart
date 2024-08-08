import 'package:flutter/material.dart';
import 'package:khusm/core/di/dependency_injection.dart';
import 'package:khusm/core/injection/injection_container.dart';
import 'package:khusm/features/main/main.dart';

void main() async {
  DependencyInjection di = DependencyInjection();
  di.init();
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  initDependecies();
  await initFeaturesDependecies();
}
