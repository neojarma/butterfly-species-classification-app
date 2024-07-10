import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import '../core/values/colors.dart';

class LoadingSpinkit extends StatelessWidget {
  const LoadingSpinkit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWave(
        color: darkBlue,
        size: 20,
      ),
    );
  }
}
