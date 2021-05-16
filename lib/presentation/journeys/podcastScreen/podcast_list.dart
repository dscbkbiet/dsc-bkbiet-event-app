import 'dart:async';

import 'package:dsc_event/domain/entities/podcast_entity.dart';
import 'package:dsc_event/presentation/journeys/podcastScreen/podcast_card.dart';
import 'package:flutter/material.dart';

class PodCastList extends StatefulWidget {
  const PodCastList(
      {Key key, this.onComplete, this.list, this.isLoading, this.onTap})
      : super(key: key);
  final VoidCallback onComplete;
  final List<PodCastEntity> list;
  final bool isLoading;
  final Function(PodCastEntity) onTap;

  @override
  _PodCastListState createState() => _PodCastListState();
}

class _PodCastListState extends State<PodCastList> {
  ScrollController _controllerPodCastList = ScrollController();

  @override
  void initState() {
    _controllerPodCastList.addListener(_scrollListenerEvents);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerPodCastList?.dispose();
  }

  void _scrollListenerEvents() async {
    if (_controllerPodCastList.offset >=
        _controllerPodCastList.position.maxScrollExtent &&
        !_controllerPodCastList.position.outOfRange) {
      widget.onComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controllerPodCastList,
      itemCount: widget.list.length + (widget.isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < widget.list.length) {
          final music = widget.list[index];
          return PodCastCard(
            podCastEntity: music,
            onTap: (data) {
              widget.onTap(data);
            },
          );
        } else {
          Timer(Duration(milliseconds: 30), () {
            _controllerPodCastList
                .jumpTo(_controllerPodCastList.position.maxScrollExtent);
          });
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
