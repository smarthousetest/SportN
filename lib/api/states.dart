import 'package:fap/api/api.dart';

abstract class CardState {}

class CardEmptyState extends CardState {}

class CardLoadingState extends CardState {}

class CardLoadedState extends CardState {
  AuthModel? loadedCard;
  CardLoadedState({this.loadedCard}) {}
}

class CardErrorState extends CardState {}
