import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/ssizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestScrren extends StatefulWidget {
  const InterestScrren({super.key});

  @override
  State<InterestScrren> createState() => _InterestScrrenState();
}

class _InterestScrrenState extends State<InterestScrren> {
  final ScrollController _scrollController = ScrollController();
  bool _isShowTitle = false;

  void _showTitle() {
    if (_scrollController.offset > 110) {
      if (_isShowTitle) return;
      _isShowTitle = true;
    } else {
      if (!_isShowTitle) return;
      _isShowTitle = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      _showTitle();
    });
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          duration: const Duration(microseconds: 300),
          opacity: _isShowTitle ? 1 : 0,
          child: const Text('Choose your interests'),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
              padding: const EdgeInsets.only(
                  left: SSizes.size24,
                  right: SSizes.size24,
                  bottom: SSizes.size16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v32,
                  const Text(
                    'Choose your interests',
                    style: TextStyle(
                      fontSize: SSizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v16,
                  const Text(
                    'Get better video recommendations',
                    style: TextStyle(
                      fontSize: SSizes.size20,
                    ),
                  ),
                  Gaps.v48,
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      for (var interest in interests)
                        InterestButton(interest: interest)
                    ],
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: SSizes.size40,
            top: SSizes.size16,
            left: SSizes.size24,
            right: SSizes.size24,
          ),
          child: GestureDetector(
            onTap: _onNextTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: SSizes.size16 + SSizes.size2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: SSizes.size16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
