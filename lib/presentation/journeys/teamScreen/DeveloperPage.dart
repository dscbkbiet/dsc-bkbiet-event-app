import 'package:dsc_event/common/constants/Images.dart';
import 'package:dsc_event/common/constants/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Images.logo,
          height: 45,
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    Strings.developerImage,
                  ),
                  radius: 50,
                  // minRadius: 40,
                  // maxRadius: 70,
                ),
                Expanded(
                  child: Text(
                    Strings.developerType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Dancing",
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
            child: Text(
              Strings.aboutDeveloper,
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.developerName,
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    openWeb("https://discord.gg/7jpqTBt", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.network(
                        Images.discord,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/dscbkbiet"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb("https://www.instagram.com/dscbkbiet/", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.network(
                        Images.instagram,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/dscbkbiet/"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb(
                        "https://www.linkedin.com/company/dsc-bkbiet", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.network(
                        Images.linkedin,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/company/dsc-bkbiet"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb(" https://twitter.com/dscbkbiet", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.network(
                        Images.twitter,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/dscbkbiet"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb("https://github.com/dscbkbiet", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.network(
                        Images.github,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/dscbkbiet"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    openWeb("https://github.com/shekharAggarwal", context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.network(
                        Images.github,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("/shekharAggarwal"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void openWeb(String url, BuildContext context) async {
    if (await canLaunch(url))
      await launch(url);
    else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Error while opening url try again!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.shade700,
      ));
  }
}
