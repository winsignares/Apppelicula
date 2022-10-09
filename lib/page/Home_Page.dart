import 'package:Apppelicula/models/model_peliculas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:Apppelicula/widgets/Card_Swiper.dart';
import 'package:Apppelicula/providers/peliculas_providers.dart';

class HomePage extends StatelessWidget{
  final peliculasproviders = PeliculasProviders();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi App de Pelicula"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _SwipperTarjeta()
          ],
        ),
      ),
    ) ;
  }

  Widget _SwipperTarjeta(){
    return FutureBuilder(
      future: peliculasproviders.getmovies(),
      builder:(BuildContext context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
          return CardSwiper( peliculas: snapshot.data as List<ModeloPeliculas>);
        }else{
          return CircularProgressIndicator();
        }

      }
    );
  }


  Widget _SwipperWidet(BuildContext context){
    final _screensize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child:  new Swiper(
        itemCount: 5,
        layout: SwiperLayout.STACK,
        itemWidth: _screensize.width * 0.7,
        itemHeight: _screensize.height * 0.9,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://educacion30.b-cdn.net/wp-content/uploads/2016/04/animales-destacada.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },

      ),
    );

  }
}