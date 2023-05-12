import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastruscture/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://st3.depositphotos.com/4111759/v/600/depositphotos_134255710-stock-ilustration-avatar-vector-male-profile-gray.jpg',
      character: cast.character);
}
