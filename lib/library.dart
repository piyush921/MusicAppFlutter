import 'package:flutter/material.dart';
import 'package:flutter_learn_project/home/ui/HomeAppBar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LibraryScreen();
  }
}

class _LibraryScreen extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF003A53), Color(0xFF000000)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              const HomeAppBar(),
              SizedBox(
                height: 800,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer(
                      duration: const Duration(seconds: 2),
                      interval: const Duration(seconds: 2),
                      color: Colors.blueGrey,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
