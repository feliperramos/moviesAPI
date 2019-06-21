class Movies {
  final String year;
  final String movies;

  /*factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(year: json['year'], movies: json['movies']);
  }*/

  //List<String> year;
  //List<String> movies;

  Movies.fromJSON(Map<String, dynamic> json)
      : year = json['year'],
        movies = json['movies'];
}
