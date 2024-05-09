import 'package:butterfly_classification/app/data/model/login/login_request.dart';
import 'package:butterfly_classification/app/data/model/login/login_response.dart';
import 'package:butterfly_classification/app/data/repository/login_repository.dart';

abstract class LoginService {
  static Future<LoginResponse> login(LoginRequest request) async {
    try {
      return await LoginRepository.login(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
