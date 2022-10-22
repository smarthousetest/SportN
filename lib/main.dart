import 'dart:io';

import 'package:fap/api/api_cubit.dart';
import 'package:fap/api/functions.dart';
import 'package:fap/auth.dart/auth_page.dart';
import 'package:fap/cards.dart/card_page.dart';
import 'package:fap/info.dart/info_page.dart';
import 'package:fap/open_about.dart';
import 'package:fap/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fap/api/locator.dart' as servic;
import 'package:shared_preferences/shared_preferences.dart';

import 'api/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await servic.init();
  Fun().ones();
  String root = await Fun().start();
  print("root = $root");
  runApp(
      root.toString() == '' || root == null ? TodoApp() : OpenAbout(res: root));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CardCubit>(create: (context) => sl<CardCubit>()),
        ],
        child: MaterialApp(
          title: 'Todo list',
          home: Splash(),
          routes: <String, WidgetBuilder>{
            '/a': (BuildContext context) => CardPage(),
            // '/b': (BuildContext context) => InfoPage(),
          },
        ));
  }
}
