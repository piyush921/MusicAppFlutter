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
    return Scaffold(
      body: Stack(
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
          const SingleChildScrollView(
              child: Column(
            children: [
              HomeAppBar(),
              //HomeCategorySlider(),
              SizedBox(height: 30),
              HomeNowPlaying(),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text('Popular',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              //HomeImageSlider(),
              SizedBox(height: 30),
              //HomeArtist(),
              SizedBox(height: 30),
              //HomeFavourites(),
              SizedBox(height: 50),
            ],
          )),
        ],
      ),
    );
  }
}
