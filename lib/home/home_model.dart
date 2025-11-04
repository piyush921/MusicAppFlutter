class HomeItem {
  final int id;
  final String title;
  final String description;

  HomeItem({
    required this.id,
    required this.title,
    required this.description,
  });

  factory HomeItem.fromJson(Map<String, dynamic> json) {
    return HomeItem(
      id: json['id'],
      title: json['title'],
      description: json['body'] ?? '',
    );
  }
}

/*{
    "dates": {
        "maximum": "2025-11-05",
        "minimum": "2025-09-24"
    },
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/kHOfxq7cMTXyLbj0UmdoGhT540O.jpg",
            "genre_ids": [
                878,
                28,
                35
            ],
            "id": 507244,
            "original_language": "en",
            "original_title": "Afterburn",
            "overview": "Set against the backdrop of a postapocalyptic Earth whose Eastern Hemisphere was destroyed by a massive solar flare, leaving what life remains mutated from radiation and fallout. The story revolves around a group of treasure hunters who extract such objects as the Mona Lisa, the Rosetta Stone and the Crown Jewels while facing rival hunters, mutants and pirates.",
            "popularity": 314.8576,
            "poster_path": "/xR0IhVBjbNU34b8erhJCgRbjXo3.jpg",
            "release_date": "2025-08-20",
            "title": "Afterburn",
            "video": false,
            "vote_average": 6.9,
            "vote_count": 94
        }
    ],
    "total_pages": 341,
    "total_results": 6809
}*/