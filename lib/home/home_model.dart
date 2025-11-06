import 'dart:convert';

class MovieResponse {
  final Dates dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      dates: Dates.fromJson(json['dates']),
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'dates': dates.toJson(),
    'page': page,
    'results': results.map((e) => e.toJson()).toList(),
    'total_pages': totalPages,
    'total_results': totalResults,
  };

  /// Optional: helper for quickly decoding from raw JSON string
  static MovieResponse fromRawJson(String str) =>
      MovieResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}

class Dates {
  final String maximum;
  final String minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'] ?? '',
      minimum: json['minimum'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'maximum': maximum,
    'minimum': minimum,
  };
}


class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      id: json['id'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'genre_ids': genreIds,
    'id': id,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'release_date': releaseDate,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
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