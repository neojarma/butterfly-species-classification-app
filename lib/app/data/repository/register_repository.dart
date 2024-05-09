import 'package:butterfly_classification/app/data/model/register/register_request.dart';
import 'package:butterfly_classification/app/data/model/register/register_response.dart';
import 'package:butterfly_classification/app/data/provider/api_provider.dart';
import 'package:get/get.dart';

abstract class RegisterRepository {
  static final getConnect = GetConnect();

  static Future<RegisterResponse> register(RegisterRequest request) async {
    Response<dynamic> req;

    try {
      req = await getConnect.post(ApiProvider.register, request.toJson());
      req.body['code'] = req.statusCode;
      return RegisterResponse.fromJson(req.body);
    } catch (e) {
      throw Exception('Failed to send request');
    }
  }
}
