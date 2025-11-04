import 'package:flutter/material.dart';

class HomeCategorySlider extends StatefulWidget {
  const HomeCategorySlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeCategorySlider();
  }

}

class _HomeCategorySlider extends State<HomeCategorySlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Container(
            width: 70,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              "Cat ${index + 1}",
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          );
        },
      ),
    );
  }

}