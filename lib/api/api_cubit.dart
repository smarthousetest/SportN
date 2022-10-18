import 'dart:convert';
import 'package:fap/api/api.dart';
import 'package:fap/api/repo.dart';
import 'package:fap/api/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ApiCubit {
  Future<AuthModel> getConfig() async {
    final String response = await rootBundle.loadString('data/json.json');
    print(response);
    final Map<String, dynamic> cardJson = json.decode(response);
    print(cardJson);

    return AuthModel.fromJson(cardJson);
  }
}

class CardCubit extends Cubit<CardState> {
  final CardRepository cardRepository;

  CardCubit(this.cardRepository) : super(CardLoadedState());

  Future<void> fetchCard() async {
    try {
      emit(CardLoadingState());
      AuthModel _loaded = await cardRepository.getAllCards();
      print("приватная  $_loaded");
      emit(CardLoadedState(loadedCard: _loaded));
    } catch (_) {
      emit(CardErrorState());
    }
  }
}
