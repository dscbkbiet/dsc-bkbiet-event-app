import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_event/common/extensions/ext.dart';
import 'package:dsc_event/data/models/podcast.dart';
import 'package:dsc_event/presentation/widgets/loadingImage.dart';
import 'package:flutter/material.dart';

const _cardColor = Color(0xFF5F40FB);
const _maxHeight = 300.0;
const _minHeight = 70.0;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer(
      {Key key,
      this.currentPodCast,
      this.onPause,
      this.onResume,
      this.onStop,
      this.isPlay})
      : super(key: key);
  final PodCast currentPodCast;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onStop;
  final bool isPlay;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _expanded = false;
  double _currentHeight = _minHeight;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuWidth = size.width * 0.2;
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          final newHeight = _currentHeight - details.delta.dy;
          _controller.value = _currentHeight / _maxHeight;
          _currentHeight = newHeight.clamp(_minHeight, _maxHeight);
        });
      },
      onVerticalDragEnd: (details) {
        if (_currentHeight < _maxHeight / 1.5) {
          _controller.reverse();
          _expanded = false;
        } else {
          _expanded = true;
          _controller.forward(from: _currentHeight / _maxHeight);
          _currentHeight = _maxHeight;
        }
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, snapshot) {
            final value =
                const ElasticInOutCurve(0.7).transform(_controller.value);
            return Stack(
              children: [
                Positioned(
                  height: lerpDouble(_minHeight, _currentHeight, value),
                  left: lerpDouble(size.width / 2 - menuWidth / 2, 0, value),
                  width: lerpDouble(menuWidth, size.width, value),
                  bottom: lerpDouble(40.0, 0.0, value),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                      bottom: Radius.circular(lerpDouble(50.0, 0.0, value)),
                    ),
                    child: ColoredBox(
                        color: _cardColor,
                        child: _expanded
                            ? Opacity(
                                opacity: _controller.value,
                                child: _buildExpandedContent())
                            : _buildMenuContent()),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _buildExpandedContent() {
    return widget.currentPodCast == null
        ? const SizedBox()
        : Container(
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.currentPodCast.imageUrl,
                  height: _maxHeight,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => CarouselImageLoading(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black26, Colors.black38]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            children: [
                              Text(
                                widget.currentPodCast.publisher,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                widget.currentPodCast.audioName
                                    .intelliTrim(size: 40),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (widget.isPlay)
                                          widget.onPause();
                                        else
                                          widget.onResume();
                                      },
                                      child: widget.isPlay
                                          ? Icon(Icons.pause,
                                              color: Colors.white)
                                          : Icon(Icons.play_arrow_outlined,
                                              color: Colors.white)),
                                  GestureDetector(
                                      onTap: () async {
                                        _controller.reverse();
                                        _expanded = false;
                                        await Future.delayed(
                                            Duration(milliseconds: 600));
                                        widget.onStop();
                                      },
                                      child: Icon(Icons.stop,
                                          color: Colors.white)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        _controller.reverse();
                        _expanded = false;
                      },
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Widget _buildMenuContent() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = true;
          _currentHeight = _maxHeight;
          _controller.forward(from: 0.0);
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: CachedNetworkImage(
          imageUrl: widget.currentPodCast.imageUrl,
          height: 50.0,
          width: 50.0,
          fit: BoxFit.contain,
          placeholder: (context, url) => CarouselImageLoading(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
