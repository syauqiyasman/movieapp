import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movieapp/model/movie_card_response.dart';
import 'package:movieapp/service/movie_service.dart';
import 'package:movieapp/widget/horizontal_list.dart';
import 'package:movieapp/widget/movie_card.dart';
import 'package:movieapp/widget/movie_card_skeleton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<MovieCardResponse>> _popularMovies;
  late Future<List<MovieCardResponse>> _nowPlayingMovies;
  late Future<List<MovieCardResponse>> _topRatedMovies;
  late Future<List<MovieCardResponse>> _upcomingMovies;

  @override
  void initState() {
    super.initState();
    _popularMovies = MovieService().getPopularMovies();
    _nowPlayingMovies = MovieService().getNowPlayingMovies();
    _topRatedMovies = MovieService().getTopRatedMovies();
    _upcomingMovies = MovieService().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          FutureBuilder(
            future: _nowPlayingMovies,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return HorizontalList(
                  title: "Now Playing",
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return MovieCardSkeleton();
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Belum ada movie"));
              } else {
                final movies = snapshot.data;
                return HorizontalList(
                  title: "Now Playing",
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
          const SizedBox(height: 8),
          FutureBuilder(
            future: _popularMovies,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return HorizontalList(
                  title: "Popular",
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return MovieCardSkeleton();
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Belum ada movie"));
              } else {
                final movies = snapshot.data;
                return HorizontalList(
                  title: "Popular",
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
          const SizedBox(height: 8),
          FutureBuilder(
            future: _topRatedMovies,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return HorizontalList(
                  title: "Top Rated",
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return MovieCardSkeleton();
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Belum ada movie"));
              } else {
                final movies = snapshot.data;
                return HorizontalList(
                  title: "Top Rated",
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
          const SizedBox(height: 8),
          FutureBuilder(
            future: _upcomingMovies,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return HorizontalList(
                  title: "Upcoming",
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return MovieCardSkeleton();
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Belum ada movie"));
              } else {
                final movies = snapshot.data;
                return HorizontalList(
                  title: "Upcoming",
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
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
