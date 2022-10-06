import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget{
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
            _SwipperWidet(context)
          ],
        ),
      ),
    ) ;
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