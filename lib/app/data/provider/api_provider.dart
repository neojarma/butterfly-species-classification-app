abstract class ApiProvider {
  static const _baseUrl = 'https://growing-advanced-sculpin.ngrok-free.app';

  static const register = '$_baseUrl/register';
  static const login = '$_baseUrl/login';

  static const images = '$_baseUrl/images';
  static const predict = '$_baseUrl/predict';

  static const observations = '$_baseUrl/observations';
  static const species = '$_baseUrl/species';
}
