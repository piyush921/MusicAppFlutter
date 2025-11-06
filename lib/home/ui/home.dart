import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_project/home/ui/HomeAppBar.dart';
import 'package:flutter_learn_project/home/ui/HomeCategorySlider.dart';
import 'package:flutter_learn_project/home/ui/HomeFavourites.dart';
import 'package:flutter_learn_project/home/ui/HomeImageSlider.dart';
import 'package:flutter_learn_project/home/ui/HomeNowPlaying.dart';
import 'package:flutter_learn_project/home/ui/homeArtist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    return switch (homeState) {
      AsyncData(:final value) => Scaffold(
          body: Stack(
            children: [
              // Background gradient image
              Image.asset(
                'assets/gradient.png',
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              SingleChildScrollView(
                  child: Column(
                children: [
                  // Top app bar
                  const HomeAppBar(),
                  // Horizontal category list
                  const HomeCategorySlider(),
                  const SizedBox(height: 30),
                  HomeQuickPicks(items: value.results),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      SizedBox(width: 10,),
                      Text('Popular',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const HomeImageSlider(),
                  const SizedBox(height: 30),
                  const HomeArtist(),
                  const SizedBox(height: 30),
                  const HomeFavourites(),
                  const SizedBox(height: 50),
                ],
              )),
            ],
          ),
        ),
      AsyncError(:final error, :final stackTrace) => Text('error: $error'),
      _ => Shimmer(
          duration: const Duration(seconds: 1),
          interval: const Duration(seconds: 1),
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
        )
    };
  }
}
