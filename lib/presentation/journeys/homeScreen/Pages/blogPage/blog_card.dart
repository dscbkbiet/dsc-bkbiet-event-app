import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/extensions/ext.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {Key key,
      this.blogImageLink,
      this.blogTitle,
      this.blogLink,
      this.blogSubTitle})
      : super(key: key);
  final String blogImageLink;
  final String blogTitle;
  final String blogSubTitle;
  final String blogLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              openLink(context, blogLink);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: blogImageLink,
                        height: 350.0,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => CarouselImageLoading(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  child: Text(
                    blogTitle,
                    maxLines: 1,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                  child: Text(
                    blogSubTitle.intelliTrim(size: 40),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }

  void openLink(BuildContext context, String blogLink) async {
    if (blogLink != null) {
      final url = blogLink;
      if (await canLaunch(url))
        await launch(url);
      else
        // can't launch url, there is some error
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Error while opening url try again!",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade700,
        ));
    }
  }
}
