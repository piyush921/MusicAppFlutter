import 'package:flutter/material.dart';
import 'package:flutter_learn_project/home/ui/HomeAppBar.dart';
import 'package:flutter_learn_project/home/ui/HomeCategorySlider.dart';
import 'package:flutter_learn_project/home/ui/HomeFavourites.dart';
import 'package:flutter_learn_project/home/ui/HomeImageSlider.dart';
import 'package:flutter_learn_project/home/ui/HomeQuickPicks.dart';
import 'package:flutter_learn_project/home/ui/homeArtist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final homeState = ref.watch(homeViewModelProvider);

    ref.read(homeViewModelProvider.notifier).refresh();
    print("data: ${homeState.value}");*/

    final homeState = ref.watch(homeViewModelProvider);
    print("home response: ${homeState.value?.page}");

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient image
          Image.asset(
            'assets/gradient.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          const SingleChildScrollView(
              child: Column(
            children: [
              // Top app bar
              HomeAppBar(),
              // Horizontal category list
              HomeCategorySlider(),
              SizedBox(height: 30),
              HomeQuickPicks(),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/user_image.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Piyush',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        'Speed Dial',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              HomeImageSlider(),
              SizedBox(height: 30),
              HomeArtist(),
              SizedBox(height: 30),
              HomeFavourites(),
              SizedBox(height: 50),

            ],
          )),
        ],
      ),
    );
  }
}
