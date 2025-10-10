import 'package:flutter/material.dart';
import 'package:flutter_learn_project/home/HomeAppBar.dart';
import 'package:flutter_learn_project/home/HomeCategorySlider.dart';
import 'package:flutter_learn_project/home/HomeFavourites.dart';
import 'package:flutter_learn_project/home/HomeImageSlider.dart';
import 'package:flutter_learn_project/home/HomeQuickPicks.dart';
import 'package:flutter_learn_project/home/homeArtist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
