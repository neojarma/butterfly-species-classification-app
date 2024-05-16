import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/butterfly_controller.dart';

class ButterflyView extends GetView<ButterflyController> {
  const ButterflyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButterflyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ButterflyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
