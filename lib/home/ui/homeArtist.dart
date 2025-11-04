import 'package:flutter/material.dart';

class HomeArtist extends StatefulWidget {
  const HomeArtist({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeArtist();
  }
}

class _HomeArtist extends State<HomeArtist> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PICK ARTIST',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      Text(
                        'Make a quick start radio',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'More',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 250,
                  child: GridView.builder(
                      scrollDirection: Axis.vertical, // scroll horizontally
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        // number of rows
                        mainAxisSpacing: 35,
                        // spacing between items horizontally
                        crossAxisSpacing: 20,
                        // spacing between items vertically
                        childAspectRatio: 0.6, // adjust item width/height
                      ),
                      itemCount: 8, // total items
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/user_image.jpg'),
                                backgroundColor: Colors.transparent,
                                radius: 35,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Name',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        );
                      })),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.radio, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Start Radio',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
