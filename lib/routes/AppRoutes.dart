import 'package:crud_flutter_cubit_project/pages/add_anggota_page.dart';
import 'package:crud_flutter_cubit_project/pages/edit_anggota_page.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

abstract class AppRoute {
  AppRoute._();

  static const homePage = '/home';
  static const addAnggotaPage = '/add-anggota';
  static const editAnggotaPage = '/edit-anggota';

  static final routes = <String, WidgetBuilder>{
    homePage: (_) => const HomePage(),
    addAnggotaPage: (_) => AddAnggotaPage(),
    editAnggotaPage: (_) => const EditAnggotaPage()
  };
}
