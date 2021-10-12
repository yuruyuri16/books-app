import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_home_project/app/view/app.dart';
import 'package:take_home_project/repositories/auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  await authRepository.user.first;
  runApp(App(authRepository: authRepository));
}
