import 'package:dsc_event/common/constants/Images.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  })  : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image.asset(
        Images.logo,
        key: const ValueKey('logo_image_key'),
        color: Colors.white,
      ),
    );
  }
}
