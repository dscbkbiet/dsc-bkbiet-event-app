import 'dart:ui';

import 'package:dsc_event/data/models/podcast.dart';
import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/presentation/blocs/musicPlayerAnimation/music_player_animation_cubit.dart';
import 'package:dsc_event/presentation/journeys/blogScreen/blogs_page.dart';
import 'package:dsc_event/presentation/journeys/eventScreen/events_list_page.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/home_drawer.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/music_controller.dart';
import 'package:dsc_event/presentation/journeys/homeScreen/music_player.dart';
import 'package:dsc_event/presentation/journeys/podcastScreen/podcast_list_page.dart';
import 'package:dsc_event/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PodCast _currentPodCast;
  PageController _pageController = PageController();
  int selectedIndex = 0;

  MusicPlayerAnimationCubit _musicPlayerAnimationCubit;

  @override
  void initState() {
    _musicPlayerAnimationCubit = getItInstance<MusicPlayerAnimationCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _musicPlayerAnimationCubit?.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: DrawerView(),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Logo(
          height: 40,
        ),
        backgroundColor: Colors.grey.shade900,
        brightness: Brightness.dark,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.white.withOpacity(0.9),
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: selectedIndex,
        onTap: (int index) {
          if (index != selectedIndex && index == 0) {
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else if (index != selectedIndex && index == 1) {
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else if (index != selectedIndex && index == 2) {
            _pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_outlined), label: "Blog"),
          BottomNavigationBarItem(
              icon: Icon(Icons.speaker_phone), label: "PodCast")
        ],
      ),
      body: BlocBuilder(
        cubit: _musicPlayerAnimationCubit,
        builder: (context, state) {
          if (state is PlayMusic) {
            _currentPodCast = state.podCast;
          }
          return Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: [
                  EventsListPage(),
                  BlogPage(),
                  PodCastPage(podCast: (data) {
                    _musicPlayerAnimationCubit.playPodCast(data);
                  }),
                ],
              ),
              if (_currentPodCast != null)
                MusicPlayer(
                  currentPodCast: _currentPodCast,
                )
            ],
          );
        },
      ),
    );
  }
}
