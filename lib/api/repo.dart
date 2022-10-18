import 'package:fap/api/api.dart';
import 'package:fap/api/api_cubit.dart';

class CardRepository {
  ApiCubit apiCubit = ApiCubit();
  Future<AuthModel> getAllCards() => apiCubit.getConfig();
}
