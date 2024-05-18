import 'package:butterfly_classification/app/core/themes/custom_snackbar_theme.dart';
import 'package:butterfly_classification/app/core/themes/font_themes.dart';
import 'package:butterfly_classification/app/core/values/colors.dart';
import 'package:butterfly_classification/app/data/model/geographic/geographic_request.dart';
import 'package:butterfly_classification/app/data/model/geographic/geographic_response.dart';
import 'package:butterfly_classification/app/data/model/species/species_response.dart';
import 'package:butterfly_classification/app/data/service/geographic_service.dart';
import 'package:butterfly_classification/app/data/service/species_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';

class GeographicController extends GetxController with StateMixin {
  late GeographicResponse observationsResults;
  var markers = <Marker>[].obs;
  late Map<int, Geographic> geographic = {};
  RxBool isClicked = false.obs;
  late Rx<Geographic> currentLocationClicked;
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  List<Species> speciesInit = [];
  List<Widget> filterChips = [];

  @override
  void onInit() async {
    initializeValue();
    fetchData(GeographicRequest(
      species: '',
      year: '',
      month: '',
    ));
    fetchAllSpecies();

    super.onInit();
  }

  void initializeValue() {
    currentLocationClicked = Rx<Geographic>(
      Geographic(
        date: '',
        fullName: '',
        id: 0,
        imagesReference: [],
        lat: 0,
        lon: 0,
        observedImage: '',
        species: '',
        total: 0,
        uploadedBy: '',
        isClicked: RxBool(false),
      ),
    );
  }

  void previewImageOnline(BuildContext context, String url) async {
    await showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void fetchData(GeographicRequest observationRequest) async {
    change(false, status: RxStatus.loading());

    observationsResults = await GeographicService.geographic(
      observationRequest,
    );

    for (var each in observationsResults.geographicResults) {
      markers.add(
        Marker(
          width: 80,
          height: 80,
          point: LatLng(each.lat, each.lon),
          child: obx(
            (state) => GestureDetector(
              onTap: () {
                showObservationInfo(each.id);
                refresh();
              },
              child: each.id == currentLocationClicked.value.id
                  ? const Icon(
                      Icons.location_on,
                      color: lightBlue,
                      size: 45,
                    )
                  : const Icon(
                      Icons.location_on,
                      color: red,
                      size: 45,
                    ),
            ),
          ),
        ),
      );

      geographic[each.id] = each;
    }

    if (markers.isEmpty) {
      CustomSnackbar.failedSnackbar(
        title: 'No Records Found',
        message: 'Your filter criteria did not match any records.',
      );
    }
    change(true, status: RxStatus.success());
  }

  void fetchAllSpecies() async {
    final resp = await SpeciesService.species();
    speciesInit = resp.species;
    filterChips = speciesInit
        .map(
          (e) => Obx(
            () => FilterChip(
              showCheckmark: false,
              label: Text(
                e.species.replaceAll('-', ' ').capitalize!,
                style: smallText.copyWith(
                  color: e.isClicked.value ? baseWhite : lightBlue,
                  fontSize: 14,
                ),
              ),
              onSelected: (_) {
                e.isClicked.value = !e.isClicked.value;
              },
              selected: e.isClicked.value,
              selectedColor: lightBlue,
              side: const BorderSide(
                color: lightBlue,
              ),
            ),
          ),
        )
        .toList();
  }

  void doFiltering() async {
    final monthInput = int.tryParse(monthController.text);
    if (monthInput != null && (monthInput < 1 || monthInput > 12)) {
      CustomSnackbar.failedSnackbar(
        title: 'Invalid Input: Month',
        message: 'Please enter a month value between 1 and 12.',
      );
      return;
    }

    final yearInput = int.tryParse(yearController.text);

    List<String> selectedSpecies = [];
    for (var each in speciesInit) {
      if (each.isClicked.value) {
        selectedSpecies.add(each.species);
      }
    }

    final strSpecies = selectedSpecies.isEmpty ? '' : selectedSpecies.join(',');

    Get.back();
    markers.clear();
    geographic.clear();
    isClicked.value = false;
    currentLocationClicked = Rx<Geographic>(
      Geographic(
        date: '',
        fullName: '',
        id: 0,
        imagesReference: [],
        lat: 0,
        lon: 0,
        observedImage: '',
        species: '',
        total: 0,
        uploadedBy: '',
        isClicked: RxBool(false),
      ),
    );
    fetchData(
      GeographicRequest(
        species: strSpecies,
        year: yearInput == null ? '' : yearInput.toString(),
        month: monthInput == null ? '' : monthInput.toString(),
      ),
    );
  }

  void showObservationInfo(int id) {
    isClicked.value = true;
    currentLocationClicked.value = geographic[id]!;
  }
}
