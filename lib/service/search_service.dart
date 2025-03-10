import 'package:http/http.dart' as http;
import 'package:movieapp/model/movie_card_response.dart';

class SearchService {
  final String apiKey = "e0c8797bcff2e8b757d8805a8abf4ade";
  final String baseUrl = "https://api.themoviedb.org/3/search/movie";

  Future<List<MovieCardResponse>> getKeyword(String query) async {
    final response = await http.get(
      Uri.parse("$baseUrl?query=$query&api_key=$apiKey&language=en-US&page=1"),
    );

    if (response.statusCode == 200) {
      return MovieCardResponse.parseMovies(response.body);
    } else {
      throw Exception("Failed to load query");
    }
  }
}
