import 'package:flutter/material.dart';
import 'package:movieapp/providers/app_provider.dart';
import 'package:movieapp/providers/movie_provider.dart';
import 'package:movieapp/widget/app_theme.dart';
import 'package:movieapp/widget/bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie App',
        theme: AppTheme.theme,
        home: const BottomNavbar(),
      ),
    );
  }
}
