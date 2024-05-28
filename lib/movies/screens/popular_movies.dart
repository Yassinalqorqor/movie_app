import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/movies/data/api_service.dart';

import '../widgets/custom_shared_list_view.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:   InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child:

          const  Icon
              ( Icons.arrow_back_ios_new_rounded)),
        title:const Text('Popular Movies') ,
        centerTitle: true,
      ),
      body:


       CustonSharedListView(futurelist: ApiService.getpopular(),),
    );
  }
}
