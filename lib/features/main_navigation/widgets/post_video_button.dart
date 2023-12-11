import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/ssizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.pVBPressSize,
  });

  final double pVBPressSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: SSizes.size24 + pVBPressSize,
          child: Container(
            width: SSizes.size20,
            height: SSizes.size32 + pVBPressSize,
            padding: const EdgeInsets.symmetric(
              horizontal: SSizes.size8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(SSizes.size10),
            ),
          ),
        ),
        Positioned(
          left: SSizes.size24 + pVBPressSize,
          child: Container(
            width: SSizes.size20,
            height: SSizes.size32 + pVBPressSize,
            padding: const EdgeInsets.symmetric(
              horizontal: SSizes.size8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(SSizes.size10),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SSizes.size10),
          ),
          height: SSizes.size32 + pVBPressSize,
          width: SSizes.size40 + pVBPressSize,
          child: FaIcon(
            FontAwesomeIcons.plus,
            color: Colors.black,
            size: SSizes.size16 + pVBPressSize,
          ),
        )
      ],
    );
  }
}
