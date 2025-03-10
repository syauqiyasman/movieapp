import 'package:http/http.dart' as http;
import 'package:movieapp/model/movie_card_response.dart';
import 'package:movieapp/model/movie_details_response.dart';

class MovieService {
  final String apiKey = "e0c8797bcff2e8b757d8805a8abf4ade";
  final String baseUrl = "https://api.themoviedb.org/3/movie";

  Future<List<MovieCardResponse>> getNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/now_playing?api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieCardResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<MovieCardResponse>> getPopularMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/popular?api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieCardResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<MovieCardResponse>> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/top_rated?api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieCardResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<MovieCardResponse>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse("$baseUrl/upcoming?api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieCardResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<MovieDetailsResponse> getMovieDetails(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$id?api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieDetailsResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<List<MovieCardResponse>> getSimilars(int id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$id/similar?api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieCardResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load popular movies");
    }
  }
}
