import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      key: ValueKey("loading_bar"),
      backgroundColor: Colors.grey.shade900,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
