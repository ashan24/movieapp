
import 'package:tmdb_api/tmdb_api.dart';

Future<dynamic> getmovie(String key) async {
  final word = key;
  // final url = Uri.https('api.themoviedb.org',
  //     '/3/movie/550?api_key=5aa523ebb04e0ceb7e14543f9caa8224');

  // final movielist = await http.get(Uri.https('api.themoviedb.org',
  //     '/3/movie/550?api_key=5aa523ebb04e0ceb7e14543f9caa8224'));
  TMDB movielist = TMDB(
      ApiKeys('5aa523ebb04e0ceb7e14543f9caa8224',
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YWE1MjNlYmIwNGUwY2ViN2UxNDU0M2Y5Y2FhODIyNCIsInN1YiI6IjYzY2UzYjA2N2YwNTQwMDA4YTc3MjhmNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EqilMAQbFgxRuoD3FW2Meks8jE5Ys_spu0F-t_Tu-Hg'),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ));
  if (word == 'nowplaying') {
    final movie = await movielist.v3.movies.getNowPlaying();
    return movie['results'];
  } else if (word == 'animation') {
    final movie = await movielist.v3.discover.getMovies(withGenres: '16');
    return movie['results'];
  } else {
    final movie = await movielist.v3.search.queryMovies(word);
    return movie['results'];
  }
}
