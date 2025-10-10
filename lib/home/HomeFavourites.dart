import 'package:flutter/material.dart';

class HomeFavourites extends StatefulWidget {
  const HomeFavourites({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeFavourites();
  }
}

class _HomeFavourites extends State<HomeFavourites> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Favourites',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
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
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        )
      ],
    );
  }
}
