import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/model/movie_card_response.dart';
import 'package:movieapp/model/movie_details_response.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/service/movie_service.dart';
import 'package:movieapp/widget/genre_chip.dart';
import 'package:movieapp/widget/horizontal_list.dart';
import 'package:movieapp/widget/movie_card.dart';
import 'package:movieapp/widget/movie_card_skeleton.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  final MovieCardResponse movie;

  const MovieDetails({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late Future<MovieDetailsResponse> _movieDetails;
  late Future<List<MovieCardResponse>> _similarMovies;

  @override
  void initState() {
    super.initState();
    _movieDetails = MovieService().getMovieDetails(widget.movie.id);
    _similarMovies = MovieService().getSimilars(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              expandedHeight: 600,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.movie.poster,
                  fit: BoxFit.cover,
                ),
              ),
              leading: Row(
                children: [
                  const SizedBox(width: 8),
                  Tooltip(
                    message: "Back",
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Consumer<MovieProvider>(
                  builder: (context, moviesProvider, child) {
                    final isMovieSaved = moviesProvider.isMovieSaved(widget.movie);
                    return Tooltip(
                      message: isMovieSaved ? "Unsaved" : "Save",
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          icon: Icon(isMovieSaved
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            if (moviesProvider.isMovieSaved(widget.movie)) {
                              moviesProvider.removeMovie(widget.movie.id);
                            } else {
                              moviesProvider.addMovie(widget.movie);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ];
        },
        body: FutureBuilder(
          future: _movieDetails,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text("Belum ada movie"));
            } else {
              final movie = snapshot.data;
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (movie.tagline != "")
                          Text(
                            movie.tagline,
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5),
                            Text(
                              "${movie.rating}/10",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: movie.genres
                              .map<Widget>((genre) => GenreChip(
                            genre: genre,
                          )).toList(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movie.overview,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder(
                    future: _similarMovies,
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return HorizontalList(
                          title: "You might also like",
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return MovieCardSkeleton();
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const SizedBox();
                      } else {
                        final movies = snapshot.data;
                        return HorizontalList(
                          title: "You might also like",
                          itemCount: min(10, movies.length),
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return MovieCard(
                              movie: movie,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
