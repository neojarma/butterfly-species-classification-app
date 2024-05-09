import 'package:butterfly_classification/app/data/model/login/login_request.dart';
import 'package:butterfly_classification/app/data/model/login/login_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class LoginRepository {
  static final getConnect = GetConnect();

  static Future<LoginResponse> login(LoginRequest request) async {
    Response<dynamic> req;
    try {
      req = await getConnect.post(ApiProvider.login, request.toJson());
      req.body['code'] = req.statusCode;
      return LoginResponse.fromJson(req.body);
    } catch (e) {
      throw Exception('Failed to send request');
    }
  }
}
