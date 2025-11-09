import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_learn_project/home/home_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../home_view_model.dart';

class HomeNowPlaying extends ConsumerWidget {
  const HomeNowPlaying({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    return Column(
      children: [
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
        switch (homeState) {
          AsyncData(:final value) => SizedBox(
                child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                height: 300,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.3, // Adjusted to give more width
                  ),
                  itemCount: value.results.length,
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
                                      '${dotenv.env['IMAGE_BASE_URL']}${value.results[index].posterPath}',
                                      fit: BoxFit.cover,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.results[index].title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12),
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
                                              value
                                                  .results[index].releaseDate,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
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
            ])),
          AsyncError(:final error, :final stackTrace) =>
            Text('error: $error'),
          _ => Container(
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
                itemCount: 6,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Shimmer(
                          duration: const Duration(seconds: 1),
                          interval: const Duration(seconds: 1),
                          color: Colors.blueGrey,
                          enabled: true,
                          direction: const ShimmerDirection.fromLTRB(),
                          child: const SizedBox(
                            height: 100,
                            width: 300,
                          )));
                },
              ),
            ),
        }
      ],
    );

    /*return switch (homeState) {
      AsyncData(:final value) => SizedBox(
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
              itemCount: value.results.length,
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
                                  '${dotenv.env['IMAGE_BASE_URL']}${value.results[index].posterPath}',
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Stack(
                                      children: [Icon(Icons.broken_image)],
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
                                    value.results[index].title,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
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
                                          value.results[index].releaseDate,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
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
        ])),
      AsyncError(:final error, :final stackTrace) => Text('error: $error'),
      _ => Container(
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
            itemCount: 6,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Shimmer(
                      duration: const Duration(seconds: 1),
                      interval: const Duration(seconds: 1),
                      color: Colors.blueGrey,
                      enabled: true,
                      direction: const ShimmerDirection.fromLTRB(),
                      child: const SizedBox(
                        height: 100,
                        width: 300,
                      )));
            },
          ),
        ),
    };*/
  }
}
