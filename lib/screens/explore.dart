import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_card_response.dart';
import 'package:movieapp/service/movie_service.dart';
import 'package:movieapp/service/search_service.dart';
import 'package:movieapp/widget/custom_text_field.dart';
import 'package:movieapp/widget/movie_card.dart';
import 'package:movieapp/widget/movie_card_skeleton.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _queryController = TextEditingController();
  List<MovieCardResponse> _resultMovies = [];
  List<MovieCardResponse> _recommendedMovies = [];
  bool _isLoading = false;
  String? _error;
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();
    _loadRecommendedMovies();
  }

  void _loadRecommendedMovies() async {
    try {
      final movies = await MovieService().getTopRatedMovies();
      setState(() {
        _recommendedMovies = movies;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  void _searchMovies() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _hasSearched = true;
    });
    try {
      final movies = await SearchService().getKeyword(_queryController.text);
      setState(() {
        _resultMovies = movies;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            CustomTextField(
              controller: _queryController,
              hintText: "Search",
              prefixIcon: Icons.search,
              onSubmitted: (_) => _searchMovies(),
              iconOnPressed: _searchMovies,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    MovieCardSkeleton(),
                    const SizedBox(height: 8),
                  ],
                ),
              )
                  : _error != null
                  ? Center(child: Text("Error: $_error"))
                  : !_hasSearched
                  ? ListView.builder(
                itemCount: _recommendedMovies.length,
                itemBuilder: (context, index) {
                  final movie = _recommendedMovies[index];
                  return Column(
                    children: [
                      MovieCard(movie: movie),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              )
                  : _resultMovies.isEmpty
                  ? const Center(child: Text("No movies found"))
                  : ListView.builder(
                itemCount: _resultMovies.length,
                itemBuilder: (context, index) {
                  final movie = _resultMovies[index];
                  return Column(
                    children: [
                      MovieCard(movie: movie),
                      const SizedBox(height: 8),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
