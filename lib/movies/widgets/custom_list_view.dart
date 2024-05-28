import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movies/data/api_service.dart';

import '../../core/app_constats.dart';
import '../models/movies_model.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key
    , required this.futurelist});
  final Future<List<MoviesModel>> futurelist ;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurelist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ), // BoxDecoration

                  child: (snapshot.data![index].image != null)
                      ? Image.network(
                    '${AppConstant.baseImage}${snapshot.data![index].image!}',
                    width: 140,
                    fit: BoxFit.fill,
                  ) // Image.network
                      : Container(
                    width: 140,
                    color: Colors.grey,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10);
              },
              itemCount:snapshot.data!.length ,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        else {
          return const Center(child: Text('error'));
        }
      },
    );
  }
}


























// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/movies/data/api_service.dart';
//
// import '../models/movies_model.dart';
//
// class CustomListView extends StatelessWidget {
//   const CustomListView({super.key
//     , required this.futurelist});
//   final Future<List<MoviesModel>> futurelist ;
//
//   @override
//   Widget build(BuildContext context) {
//     return   FutureBuilder(
//       future: futurelist,
//       builder: (context,snapshot) {
//         if(snapshot.hasData){
//           return SizedBox(
//               height: 160,
//               child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context,index){
//                     return Container(
//
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//
//                         decoration: BoxDecoration(
//
//                         borderRadius: BorderRadius.circular(10)
//
//                     ), // BoxDecoration
//
//                     child: (snapshot.data! [index].image !=null)?
//
//                     Image.network(
//
//                     'https://image.tmdb.org/t/p/w500/${snapshot.data![index].image!}',
//
//                     width: 140,
//
//                     fit: BoxFit.fill,
//
//                     ): // Image.network
//
//                     Container(
//
//                     width: 140,
//
//                     color:Colors.grey,
//                     ),
//                     );
//                   },
//
//                   separatorBuilder: (context,index){
//                     return const SizedBox(width: 10,);
//                   },
//                  itemCount:snapshot.data!.length ,)
//           );
//         }
//         else if(snapshot.connectionState==ConnectionState.waiting){
//          return const Center(child: CircularProgressIndicator());
//         }
//         else{
//            const Center(child: Text('error'));
//         }
//
//       },
//
//     );
//   }
// }
