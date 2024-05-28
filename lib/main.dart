import 'package:flutter/material.dart';

import 'movies/screens/movie_scrre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(


    useMaterial3: false,),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:  const MoviesScreen(),
    );
  }
}
