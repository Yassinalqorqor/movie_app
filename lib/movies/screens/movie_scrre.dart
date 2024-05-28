

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/movies/screens/popular_movies.dart';
import 'package:movie_app/movies/screens/top_rated_movies.dart';

import '../data/api_service.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/custom_row.dart';
import '../widgets/now_playin_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body:SingleChildScrollView(
        child: Column(
          children: [
            const Nowplayingwidget(),
            const SizedBox(
              height: 10,),
            CustomRow(title: 'popular',
            onTap: (){
              ApiService.getnowplaying();
             /*Navigator.push(context, MaterialPageRoute(builder: (context)=>PopularMovies(),

             )) ;*/

            },
            ),
            const SizedBox(
              height: 10,),
              CustomListView(
               futurelist:ApiService.getpopular(),),
            const SizedBox(
              height: 20,),
            CustomRow(title: 'Top Rated',
              onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>TopRatedMovies(),
              ),
              );
              },
            ),
            const SizedBox(
              height: 10,),
             CustomListView(
               futurelist: ApiService.toprated(),
            ),
            const SizedBox(
              height: 20,),
          ],
        ),
      ),
    );
  }
}
