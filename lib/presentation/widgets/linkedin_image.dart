import 'package:dsc_event/common/constants/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkedInImage extends StatelessWidget {
  final double height;
  final double width;

  const LinkedInImage({
    Key key,
    @required this.height,
    @required this.width,
  })  : assert(height != null || width != null,
            'height and width must not be null'),
        assert(height > 0 || width != null,
            'height and width should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      Images.linkedin,
      height: height,
      width: width,
      key: const ValueKey('linkedin_image'),
      color: Colors.blueAccent,
    );
  }
}
