import 'package:fap/api/api_cubit.dart';
import 'package:fap/auth.dart/auth_page.dart';
import 'package:fap/cards.dart/card_page.dart';
import 'package:fap/info.dart/info_page.dart';
import 'package:fap/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fap/api/locator.dart' as servic;

import 'api/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await servic.init();
  runApp(new TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CardCubit>(create: (context) => sl<CardCubit>()),
        ],
        child: new MaterialApp(
          title: 'Todo list',
          home: Splash(),
          routes: <String, WidgetBuilder>{
            '/a': (BuildContext context) => CardPage(),
            // '/b': (BuildContext context) => InfoPage(),
          },
        ));
  }
}
