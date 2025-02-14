part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();
  
  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MoviesState {}
