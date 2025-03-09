import "dart:convert";

class MovieCardResponse {
  int id;
  String title;
  String poster;
  String rating;

  MovieCardResponse({
    required this.id,
    required this.title,
    required this.poster,
    required this.rating,
  });

  factory MovieCardResponse.fromJson(Map<String, dynamic> json) {
    return MovieCardResponse(
      id: json["id"] ?? 0,
      title: json["title"] ?? "Unknown",
      poster: json["poster_path"] != null
          ? "https://image.tmdb.org/t/p/w500" + json["poster_path"]
          : "https://github.com/user-attachments/assets/c4e46508-0fc3-4f29-9da8-81d75b9a0405",
      rating: json["vote_average"] != null
          ? json["vote_average"].toStringAsFixed(1)
          : "0.0",
    );
  }

  static List<MovieCardResponse> parseMovies(String jsonResponse) {
    final parsed = json.decode(jsonResponse)["results"]
        .map<MovieCardResponse>((json) => MovieCardResponse.fromJson(json))
        .toList();

    return parsed;
  }
}
