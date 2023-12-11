// ignore_for_file: unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.selectIcon,
    required this.selectIndex,
  });

  final String text;
  final IconData icon;
  final IconData selectIcon;
  final bool isSelected;
  final Function onTap;
  final int selectIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: selectIndex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.v10,
                FaIcon(
                  isSelected ? selectIcon : icon,
                  color: selectIndex == 0 ? Colors.white : Colors.black,
                ),
                Gaps.v10,
                Text(
                  text,
                  style: TextStyle(
                    color: selectIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
