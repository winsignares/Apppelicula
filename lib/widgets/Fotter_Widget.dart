import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Apppelicula/widgets/movie_horizontal.dart';
import 'package:Apppelicula/models/model_peliculas.dart';
import 'package:Apppelicula/providers/peliculas_providers.dart';

Widget footer(BuildContext context, PeliculasProviders peliculasprovider) {

  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.0),
          child:
          Text('Populares', style: Theme.of(context).textTheme.subtitle1),
        ),
        SizedBox(
          height: 5.0,
        ),
        FutureBuilder(
            future: peliculasprovider.getPopular(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  //snapshot.data faltaba .data
                  peliculas: snapshot.data as List<ModeloPeliculas>
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

            })
      ],
    ),
  );
}
