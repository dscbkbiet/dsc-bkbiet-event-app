import 'package:dsc_event/consts/Common.dart';
import 'package:dsc_event/consts/Strings.dart';
import 'package:dsc_event/screens/HomePage.dart';
import 'package:dsc_event/stateManager/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Common.calls.getEvents(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Consumer(builder: ((key, watch, _) {
          final list = watch(eventsProvider).event;
          if (list != null && list.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => MyHomePage()));
            });
          }
          return Stack(
            children: [
              Center(child: Image.asset(Strings.logo)),
              Align(child: LinearProgressIndicator(
                backgroundColor:Colors.grey.shade900,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              alignment: Alignment.bottomCenter,)
            ],
          );
        })));
  }
}
