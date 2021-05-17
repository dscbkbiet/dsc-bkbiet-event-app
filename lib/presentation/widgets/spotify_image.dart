import 'package:dsc_event/common/constants/Images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpotifyImage extends StatelessWidget {
  final double height;
  final double width;

  const SpotifyImage({
    Key key,
    @required this.height,
    @required this.width,
  })  : assert(height != null || width != null,
            'height and width must not be null'),
        assert(height > 0 || width > 0,
            'height and width should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      Images.spotify,
      height: height,
      width: width,
      key: const ValueKey('spotify_image'),
      color: Colors.black,
    );
  }
}
