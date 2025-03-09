import "dart:convert";

class MovieDetailsResponse {
  String title;
  String poster;
  String rating;
  String releaseDate;
  int runtime;
  String tagline;
  String overview;
  String status;
  List<String> genres;

  MovieDetailsResponse({
    required this.title,
    required this.poster,
    required this.rating,
    required this.releaseDate,
    required this.runtime,
    required this.tagline,
    required this.overview,
    required this.status,
    required this.genres,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      title: json["title"] ?? "Unknown",
      poster: json["poster_path"] != null
          ? "https://image.tmdb.org/t/p/w500" + json["poster_path"]
          : "https://github.com/user-attachments/assets/c4e46508-0fc3-4f29-9da8-81d75b9a0405",
      rating: json["vote_average"] != null
          ? json["vote_average"].toStringAsFixed(1)
          : "0.0",
      releaseDate: json["release_date"] ?? "Unknown",
      runtime: json["runtime"] ?? 0,
      tagline: json["tagline"] ?? "",
      overview: json["overview"] ?? "No overview available",
      status: json["status"] ?? "Unknown",
      genres: json["genres"] != null
          ? List<String>.from(json["genres"].map((genre) => genre["name"] ?? "Unknown"))
          : [],
    );
  }

  static MovieDetailsResponse parseMovies(String jsonResponse) {
    return MovieDetailsResponse.fromJson(json.decode(jsonResponse));
  }
}
