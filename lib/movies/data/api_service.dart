//7c354a1115ebf88a11666ddc68f0be38

//base image url=https://image.tmdb.org/t/p/w500/


import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:movie_app/movies/models/movies_model.dart';

class ApiService{
 static String apikey ="7c354a1115ebf88a11666ddc68f0be38";
  static String baseUrl ="https://api.themoviedb.org/3/movie/";
 static Future<List<MoviesModel>> getnowplaying()async{
  List <MoviesModel> nowPlayingList = [];
  try{
   var Url = Uri.parse('${baseUrl} now_playing?api_key=$apikey');
   var respone= await  http.get(Url);
   var responseConverted= jsonDecode(respone.body);
   List listFromApi =responseConverted['results'];
   for (var element in listFromApi) {
    nowPlayingList.add(MoviesModel.fromJson(element));
   }
   return nowPlayingList;
  }catch(e){
   print('error from now playing$e');
   return[];
  }



 }

 static Future<List<MoviesModel>> getpopular()async{
  List <MoviesModel> popularList = [];
  try{
   var Url = Uri.parse('${baseUrl} popular?api_key=$apikey');
   var respone= await  http.get(Url);
   var responseConverted= jsonDecode(respone.body);
   List listFromApi =responseConverted['results'];
   for (var element in listFromApi) {
    popularList.add(MoviesModel.fromJson(element));
   }
   return popularList;
  }catch(e){
   print('error from now playing$e');
   return[];
  }



 }

 static Future<List<MoviesModel>> toprated()async{
  List <MoviesModel> topratedList = [];
  try{
   var Url = Uri.parse('${baseUrl} top_rated?api_key=$apikey');
   var respone= await  http.get(Url);
   var responseConverted= jsonDecode(respone.body);
   List listFromApi =responseConverted['results'];
   for (var element in listFromApi) {
    topratedList.add(MoviesModel.fromJson(element));
   }
   return topratedList;
  }catch(e){
   print('error from now playing$e');
   return[];
  }



 }
}




