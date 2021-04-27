import 'package:dsc_event/common/constants/Images.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/HomeScreen.dart';
import 'package:dsc_event/presentation/widgets/loading_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    pushToNewPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Stack(
          children: [
            Center(child: Image.asset(Images.logo)),
            Align(
              child: LoadingBar(),
              alignment: Alignment.bottomCenter,
            )
          ],
        ));
  }

  void pushToNewPage() async {
    await Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }
}
