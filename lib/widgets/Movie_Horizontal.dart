import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:Apppelicula/models/model_peliculas.dart';

class MovieHorizontal extends StatelessWidget {
  final List<ModeloPeliculas> peliculas;
  MovieHorizontal({required this.peliculas});
  final _pageControlle =  new PageController(
      initialPage: 1,
      viewportFraction: 0.3
  );
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.20,
      child: PageView(
        pageSnapping: false,
        controller: _pageControlle,
        children: _tarjetas(context),

      ),
    );
  }


 List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:  FadeInImage(
                  image: NetworkImage(pelicula.getposterImg()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 120.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                pelicula.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              )
              ],
      )
      );
    }).toList();
  }
}
