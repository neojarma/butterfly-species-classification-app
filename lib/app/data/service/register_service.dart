import 'package:butterfly_classification/app/data/model/register/register_request.dart';
import 'package:butterfly_classification/app/data/model/register/register_response.dart';
import 'package:butterfly_classification/app/data/repository/register_repository.dart';

abstract class RegisterService {
  static Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      return await RegisterRepository.register(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
