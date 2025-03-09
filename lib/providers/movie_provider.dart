import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_card_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieProvider with ChangeNotifier {
  List<MovieCardResponse> _movies = [];

  List<MovieCardResponse> get movies => _movies;

  MovieProvider() {
    _loadMoviesFromPrefs();
  }

  void addMovie(MovieCardResponse movie) async {
    _movies.add(movie);
    await _saveMoviesToPrefs();
    notifyListeners();
  }

  void removeMovie(int id) async {
    _movies.removeWhere((movie) => movie.id == id);
    await _saveMoviesToPrefs();
    notifyListeners();
  }

  bool isMovieSaved(MovieCardResponse movie) {
    return _movies.any((savedMovie) => savedMovie.id == movie.id);
  }

  Future<void> _saveMoviesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(_movies.map((m) => {
      "id": m.id,
      "title": m.title,
      "poster": m.poster,
      "rating": m.rating
    }).toList());
    await prefs.setString("saved_movies", encodedData);
  }

  Future<void> _loadMoviesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? moviesString = prefs.getString("saved_movies");
    if (moviesString != null) {
      final List<dynamic> decodedData = jsonDecode(moviesString);
      _movies = decodedData.map((json) => MovieCardResponse(
        id: json["id"],
        title: json["title"],
        poster: json["poster"],
        rating: json["rating"],
      )).toList();
      notifyListeners();
    }
  }
}
