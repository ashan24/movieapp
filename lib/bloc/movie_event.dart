part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class Homepageapi extends MovieEvent {
  @override
  List<Object> get props => [];
}

class Search extends MovieEvent {
  final String key;
  const Search({required this.key});
  @override
  List<Object> get props => [];
}
