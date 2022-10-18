import 'package:fap/api/api.dart';
import 'package:fap/api/api_cubit.dart';
import 'package:fap/api/states.dart';
import 'package:fap/cards.dart/card_model.dart';
import 'package:fap/info.dart/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth.dart/auth_page.dart';

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  AuthModel authModel = AuthModel();

  @override
  Widget build(BuildContext context) {
    CardCubit cardCubit = context.read<CardCubit>();
    cardCubit.fetchCard();
    return Material(
        child: Scaffold(
            appBar:
                AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
              Row(
                children: [
                  Text(
                    "Выйти",
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AuthPage()),
                        );
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ))
                ],
              )
            ]),
            backgroundColor: Colors.white,
            body: BlocBuilder<CardCubit, CardState>(builder: ((context, state) {
              if (state is CardErrorState) {
                return Center(
                  child: Text("Ошибка"),
                );
              }
              if (state is CardLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CardLoadedState) {
                return ListView.builder(
                    itemCount: state.loadedCard?.articles!.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InfoPage(
                                      index: index,
                                    ),
                                  ));
                            },
                            child: CardView(
                              number: index + 1,
                              title: state.loadedCard!.articles![index].title!,
                              text: state
                                  .loadedCard!.articles![index].description!,
                            ),
                          ),
                        )));
              }
              return Text("");
            }))));
  }
}
