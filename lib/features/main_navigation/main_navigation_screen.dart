// ignore_for_file: unused_import, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/ssizes.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/discover/discover_screen.dart';
import 'package:tiktok_clone/features/inbox/inbox_screen.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tap.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/videos/video_timeline_screen.dart';

class MainNavigationScrren extends StatefulWidget {
  const MainNavigationScrren({super.key});

  @override
  State<MainNavigationScrren> createState() => _MainNavigationScrrenState();
}

class _MainNavigationScrrenState extends State<MainNavigationScrren> {
  int _selectIndex = 3;
  double _pVBPressSize = 0.0;

  final _screen = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Discover'),
    ),
    const Center(
      child: Text(' '),
    ),
    const Center(
      child: Text('Inbox'),
    ),
    const Center(
      child: Text('Profile'),
    )
  ];
  void _onSelect(index) {
    setState(() {});
    _selectIndex = index;
  }

  void _onPostVideoButton() {
    setState(() {
      _pVBPressSize = 0.0;
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Video Recording'),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  void _onPVBTapDown() {
    setState(() {
      _pVBPressSize = SSizes.size10;
    });
  }

  void _onPVBTapCancel() {
    setState(() {
      _pVBPressSize = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectIndex == 0 ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectIndex != 3,
            child: const InboxScreen(),
          ),
          Offstage(
            offstage: _selectIndex != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(
            SSizes.size12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: 'Home',
                icon: FontAwesomeIcons.house,
                selectIcon: FontAwesomeIcons.houseChimney,
                isSelected: _selectIndex == 0,
                onTap: () => _onSelect(0),
                selectIndex: _selectIndex,
              ),
              NavTab(
                text: 'Discover',
                icon: FontAwesomeIcons.compass,
                selectIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectIndex == 1,
                onTap: () => _onSelect(1),
                selectIndex: _selectIndex,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButton,
                onTapDown: (detail) {
                  _onPVBTapDown();
                },
                onTapCancel: _onPVBTapCancel,
                child: PostVideoButton(pVBPressSize: _pVBPressSize),
              ),
              Gaps.h24,
              NavTab(
                text: 'Inbox',
                icon: FontAwesomeIcons.message,
                selectIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectIndex == 3,
                onTap: () => _onSelect(3),
                selectIndex: _selectIndex,
              ),
              NavTab(
                text: 'Profile',
                icon: FontAwesomeIcons.user,
                selectIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectIndex == 4,
                onTap: () => _onSelect(4),
                selectIndex: _selectIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
