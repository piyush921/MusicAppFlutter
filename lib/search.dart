import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn_project/home/HomeAppBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchScreen();
  }
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/gradient.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppBar(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                              hintText: 'Search for Anything',
                              hintStyle: TextStyle(color: Colors.white60),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12)),
                          onChanged: (value) {
                            print('Name: $value');
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.mic, color: Colors.white)),
                  const SizedBox(width: 10),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 6),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.multitrack_audio,
                          color: Colors.white)),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Albums and Singles',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white60,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 120, // desired width
                            height: 160,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/thumb.jpg',
                                fit: BoxFit.cover,
                              ),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Song Title',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const Text(
                          'Artist Name',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Songs',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white60,
                    )
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/thumb.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Title',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.verified,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Artist',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'moods and genres',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white60,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 50,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.3, // Adjusted to give more width
                  ),
                  itemCount: 16,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    final randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: double.infinity,
                            width: 5,
                            child: Container(
                              color: randomColor,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Category',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 100,)
            ],
          ),
        )
      ],
    ));
  }
}
