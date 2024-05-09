import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/geographic_controller.dart';

class GeographicView extends GetView<GeographicController> {
  const GeographicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeographicView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GeographicView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
