import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselImageLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 350.0,
        width: 350.0,
        color: Colors.white,
      ),
    );
  }
}
