import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/ssizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Discover'),
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.only(
              left: SSizes.size16,
              right: SSizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SSizes.size14,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(
                SSizes.size5,
              ),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: SSizes.size10,
                mainAxisSpacing: SSizes.size10,
                childAspectRatio: 9 / 16,
              ),
              itemBuilder: (context, index) => Container(
                color: Colors.amber,
                child: Center(
                  child: Text(
                    "$index",
                  ),
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab),
              )
          ],
        ),
      ),
    );
  }
}
