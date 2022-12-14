import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//llamamos o importamo el modelo
import 'package:Apppelicula/models/model_peliculas.dart';

class PeliculasProviders {
  String _apikey = "76e77ec00c5cf623948433d17bc2264b";
  String _url = "api.themoviedb.org";
  String _language = "en-US";

  int _popularesPage = 0;
  bool _cargando = false;

  List<ModeloPeliculas> _populares = [];

  /**
    * debemos colocar el future como lista de modelo pelicula
     */

  Future<List<ModeloPeliculas>> getmovies() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<ModeloPeliculas>> getPopular() async {
    if (_cargando) return [];
    _cargando = true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }
}
