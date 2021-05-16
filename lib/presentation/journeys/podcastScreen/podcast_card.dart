import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/domain/entities/podcast_entity.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:flutter/material.dart';
import 'package:dsc_event/common/extensions/ext.dart';

class PodCastCard extends StatelessWidget {
  final PodCastEntity podCastEntity;
  final Function(PodCastEntity) onTap;

  const PodCastCard({Key key, this.podCastEntity, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(podCastEntity);
      },
      child: Card(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: podCastEntity.imageUrl,
                        height: 300.0,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => CarouselImageLoading(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      podCastEntity.publisher,
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
                      podCastEntity.audioName.intelliTrim(size: 40),
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
      ),
    );
  }
}
