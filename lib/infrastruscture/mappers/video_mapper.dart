import 'package:mymovies/domain/entities/entities.dart';
import 'package:mymovies/infrastruscture/models/moviedb/moviedb_videos.dart';

class VideoMapper {
  static moviedbVideoToEntity(Result moviedbVideo) => Video(
        id: moviedbVideo.id,
        name: moviedbVideo.name,
        youtubeKey: moviedbVideo.key,
        publishedAt: moviedbVideo.publishedAt,
      );
}
