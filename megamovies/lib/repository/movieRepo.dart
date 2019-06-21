import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/movie.dart';

Future<Stream<Movies>> getMovies() async {
  final String url =
      'http://192.168.15.14:5000/api/movie/count/?title=Spiderman';

  final client = new http.Client();

  final resp = await client.send(http.Request('get', Uri.parse(url)));

  return resp.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Movies.fromJSON(data));
}
