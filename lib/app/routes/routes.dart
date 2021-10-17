import 'package:flutter/material.dart';
import 'package:take_home_project/app/app.dart';
import 'package:take_home_project/home/home.dart';
import 'package:take_home_project/login/login.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
