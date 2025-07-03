import 'package:editor/Util/Constant.dart';
import 'package:flutter/material.dart';

class GradientHeader extends StatelessWidget {
  const GradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
