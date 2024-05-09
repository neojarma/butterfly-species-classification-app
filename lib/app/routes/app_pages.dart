import 'package:get/get.dart';

import '../modules/butterfly/bindings/butterfly_binding.dart';
import '../modules/butterfly/views/butterfly_view.dart';
import '../modules/geographic/bindings/geographic_binding.dart';
import '../modules/geographic/views/geographic_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loading_page/bindings/loading_page_binding.dart';
import '../modules/loading_page/views/loading_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/observe/bindings/observe_binding.dart';
import '../modules/observe/views/observe_view.dart';
import '../modules/preview_image/bindings/preview_image_binding.dart';
import '../modules/preview_image/views/preview_image_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/statistic/bindings/statistic_binding.dart';
import '../modules/statistic/views/statistic_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.OBSERVE,
      page: () => const ObserveView(),
      binding: ObserveBinding(),
    ),
    GetPage(
      name: _Paths.GEOGRAPHIC,
      page: () => const GeographicView(),
      binding: GeographicBinding(),
    ),
    GetPage(
      name: _Paths.STATISTIC,
      page: () => const StatisticView(),
      binding: StatisticBinding(),
    ),
    GetPage(
      name: _Paths.BUTTERFLY,
      page: () => const ButterflyView(),
      binding: ButterflyBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW_IMAGE,
      page: () => const PreviewImageView(),
      binding: PreviewImageBinding(),
    ),
    GetPage(
      name: _Paths.LOADING_PAGE,
      page: () => const LoadingPageView(),
      binding: LoadingPageBinding(),
    ),
  ];
}