part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final List<dynamic> nowplaying;
  final List<dynamic> animationfilm;
  final List<dynamic> searchfilm;

  const MovieState({
    this.nowplaying = const <dynamic>[],
    this.animationfilm = const <dynamic>[],
    this.searchfilm = const <dynamic>[],
  });

  @override
  List<Object> get props => [nowplaying];
  List<Object> get animation => [animationfilm];
  List<Object> get search => [searchfilm];
}
