import 'package:butterfly_classification/app/data/model/butterflies/butterflies_response.dart';
import 'package:get/get.dart';

class DetailButterflyController extends GetxController {
  final Butterfly butterfly = Get.arguments;
  String currentSpeciesStatus = '';
  final speciesStatus = ['NE', 'DD', 'LC', 'NT', 'VU', 'EN', 'CR', 'EW', 'EX'];
  final statuses = {
    'NE': 'Not Evaluated',
    'DD': 'Data Deficient',
    'LC': 'Least Concern',
    'NT': 'Near Threatened',
    'VU': 'Vulnerable',
    'EN': 'Endangered',
    'CR': 'Critically Endangered',
    'EW': 'Extinct in the Wild',
    'EX': 'Extinct',
  };

  @override
  void onInit() {
    for (var element in speciesStatus) {
      final res = butterfly.populationStatus.split('(')[1].replaceAll(')', '');
      if (res == element) {
        currentSpeciesStatus = element;
        break;
      }
    }

    super.onInit();
  }
}
