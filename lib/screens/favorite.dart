import 'package:flutter/material.dart';
import 'package:movieapp/providers/app_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/widget/button.dart';
import 'package:movieapp/widget/movie_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favorite"),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, moviesProvider, child) {
          final savedMovies = moviesProvider.movies;

          return savedMovies.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "You don't have any favorited movies yet.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Button(
                  label: "Explore now!",
                  icon: Icons.search,
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    appProvider.tab = 1;
                  },
                ),
              ],
            ),
          )
              : ListView.builder(
            itemCount: savedMovies.length,
            itemBuilder: (context, index) {
              final movie = savedMovies[index];
              return Column(
                children: [
                  MovieCard(movie: movie),
                  const SizedBox(height: 8),
                ],
              );
            },
          );
        }
      ),
    );
  }
}
