import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  final String genre;

  const GenreChip({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        genre,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      elevation: 4,
      labelStyle: TextStyle(color: Colors.black),
    );
  }
}
