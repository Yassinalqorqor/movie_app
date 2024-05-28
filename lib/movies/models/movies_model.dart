class MoviesModel{
  String? title;
  String? description;
  String? image;
  int? ratingCount;
  double? ratingAverege;
  String? date;

  MoviesModel.fromJson(Map<String,dynamic>json){
    title=json["title"];
    description=json["overview"];
    image=json["poster_path"];
    ratingCount=json["vote_count"];
    ratingAverege=json["vote_average"];
    date=json["release_date"];

  }
}