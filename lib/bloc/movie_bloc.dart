import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/Api/moviesapi.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    on<Homepageapi>((event, emit) async {
      final playing = await getmovie('nowplaying');
      final animation = await getmovie('animation');
      emit(MovieState(nowplaying: playing, animationfilm: animation));
    });
    on<Search>((event, emit) async {
      final search = await getmovie(event.key);

      emit(MovieState(searchfilm: search));
    });
  }
}
