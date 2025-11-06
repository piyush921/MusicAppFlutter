import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_learn_project/home/home_model.dart';

class HomeQuickPicks extends StatelessWidget {
  final List<Movie> items;

  const HomeQuickPicks({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Now Playing',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white))
          ],
        ),
      ),
      // Horizontal Grid
      Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 300,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.3, // Adjusted to give more width
          ),
          itemCount: items.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  // Left content (image + text)
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              '${dotenv.env['IMAGE_BASE_URL']}${items[index].posterPath}',
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                print("error loading image: $error");
                                return const Stack(
                                  children: [
                                    Icon(Icons.broken_image)
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Text column
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].title,
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      items[index].releaseDate,
                                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // More button
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    constraints: const BoxConstraints(),
                    iconSize: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ]));
  }
}
