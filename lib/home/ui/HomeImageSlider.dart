import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeImageSlider extends StatefulWidget {
  const HomeImageSlider({super.key});

  @override
  State<HomeImageSlider> createState() => _HomeImageSlider();
}

class _HomeImageSlider extends State<HomeImageSlider> {
  final List<String> images = List.generate(
    18,
    (index) => 'https://picsum.photos/200?image=${index + 1}',
  );

  int? selectedIndex;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<List<String>> chunks = [];
    for (var i = 0; i < images.length; i += 9) {
      chunks.add(
          images.sublist(i, (i + 9) > images.length ? images.length : i + 9));
    }

    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              currentPage = index;
            });
          },
        ),
        items: chunks.asMap().entries.map((entry) {
          final pageIndex = entry.key;
          final chunk = entry.value;

          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: chunk.length,
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable GridView scrolling
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final globalIndex = pageIndex * 9 + index;
                    final isSelected = selectedIndex == globalIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = globalIndex;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(color: Colors.white, width: 3)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            chunk[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: chunks.asMap().entries.map((entry) {
          return Container(
            width: currentPage == entry.key ? 10.0 : 8.0,
            height: currentPage == entry.key ? 10.0 : 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == entry.key
                  ? Colors.white
                  : Colors.white.withOpacity(0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
