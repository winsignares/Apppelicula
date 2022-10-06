class Peliculas{
    List<ModeloPeliculas> items = [];

    Peliculas();

    Peliculas.fromJsonList(List<dynamic> jsonList){
        if(jsonList == null) return;
        for(var item in jsonList){
            final pelicula = ModeloPeliculas.fromJsonMap(item);
            items.add(pelicula);
        }
    }
}

class ModeloPeliculas{
    /**
    *Tenemos los attb de la clase
     */
    late int voteColum;
    late int id;
    late bool video;
    late double voteAverage;
    late String title;
    late double popularity;
    late String originalLanguge;
    late String posterPath;
    late String originalTitle;
    late List<int> genreIds;
    late String overview;
    late String relaseDate;
    late String brackdropPath;
    late bool adult;
    
    ModeloPeliculas(
        this.voteColum,
        this.id,
        this.video,
        this.voteAverage,
        this.title,
        this.popularity,
        this.originalLanguge,
        this.posterPath,
        this.genreIds,
        this.overview,
        this.relaseDate,
        this.brackdropPath,
        this.adult
    );

    ModeloPeliculas.fromJsonMap(Map<String, dynamic> json){
        voteColum = json['vote_colum'];
        id= json['id'];
        video= json['video'];
        voteAverage= json['vote_average']/1;
        title= json['title'];
        popularity= json['popularity'];
        originalLanguge= json['original_language'];
        posterPath= json['poster_path'];
        genreIds= json['genre_ids'].cast<int>();
        overview= json['overview'];
        relaseDate= json['relase_date'];
        brackdropPath= json['brackdrop_path'];
        adult= json['adult'];
    }

    getposterImg(){
        if(posterPath == null){
            return 'https://cdn11.bigcommerce.com/s-auu4kfi2d9/stencil/59512910-bb6d-0136-46ec-71c445b85d45/e/933395a0-cb1b-0135-a812-525400970412/icons/icon-no-image.svg';
        }else{
            return 'https://image.tmdb.org/t/p/w500/$brackdropPath';
        }
    }

}