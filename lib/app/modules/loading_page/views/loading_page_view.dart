import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loading_page_controller.dart';

class LoadingPageView extends GetView<LoadingPageController> {
  const LoadingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoadingPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoadingPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
