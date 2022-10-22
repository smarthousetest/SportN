import 'dart:convert';
import 'dart:io';
import 'package:fap/api/api.dart';
import 'package:fap/api/repo.dart';
import 'package:fap/api/states.dart';
import 'package:fap/main.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
