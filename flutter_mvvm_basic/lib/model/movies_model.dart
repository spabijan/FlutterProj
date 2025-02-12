// // ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables

// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class MoviesModel extends Equatable {
//   final int page;
//   final List<Result> results;
//   final int total_pages;
//   final int total_results;
//   MoviesModel({
//     required this.page,
//     required this.results,
//     required this.total_pages,
//     required this.total_results,
//   });

//   MoviesModel copyWith({
//     int? page,
//     List<Result>? results,
//     int? total_pages,
//     int? total_results,
//   }) {
//     return MoviesModel(
//       page: page ?? this.page,
//       results: results ?? this.results,
//       total_pages: total_pages ?? this.total_pages,
//       total_results: total_results ?? this.total_results,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'page': page,
//       'results': results.map((x) => x.toMap()).toList(),
//       'total_pages': total_pages,
//       'total_results': total_results,
//     };
//   }

//   factory MoviesModel.fromMap(Map<String, dynamic> map) {
//     return MoviesModel(
//       page: map['page']?.toInt() ?? 0,
//       results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
//       total_pages: map['total_pages']?.toInt() ?? 0,
//       total_results: map['total_results']?.toInt() ?? 0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MoviesModel.fromJson(String source) =>
//       MoviesModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'PopularMovies(page: $page, results: $results, total_pages: $total_pages, total_results: $total_results)';
//   }

//   @override
//   List<Object> get props => [page, results, total_pages, total_results];
// }

// class Result extends Equatable {
//   final bool adult;
//   final String backdrop_path;
//   final List<int> genre_ids;
//   final int id;
//   final String original_language;
//   final String original_title;
//   final String overview;
//   final double popularity;
//   final String poster_path;
//   final String release_date;
//   final String title;
//   final bool video;
//   final double vote_average;
//   final int vote_count;
//   Result({
//     required this.adult,
//     required this.backdrop_path,
//     required this.genre_ids,
//     required this.id,
//     required this.original_language,
//     required this.original_title,
//     required this.overview,
//     required this.popularity,
//     required this.poster_path,
//     required this.release_date,
//     required this.title,
//     required this.video,
//     required this.vote_average,
//     required this.vote_count,
//   });

//   Result copyWith({
//     bool? adult,
//     String? backdrop_path,
//     List<int>? genre_ids,
//     int? id,
//     String? original_language,
//     String? original_title,
//     String? overview,
//     double? popularity,
//     String? poster_path,
//     String? release_date,
//     String? title,
//     bool? video,
//     double? vote_average,
//     int? vote_count,
//   }) {
//     return Result(
//       adult: adult ?? this.adult,
//       backdrop_path: backdrop_path ?? this.backdrop_path,
//       genre_ids: genre_ids ?? this.genre_ids,
//       id: id ?? this.id,
//       original_language: original_language ?? this.original_language,
//       original_title: original_title ?? this.original_title,
//       overview: overview ?? this.overview,
//       popularity: popularity ?? this.popularity,
//       poster_path: poster_path ?? this.poster_path,
//       release_date: release_date ?? this.release_date,
//       title: title ?? this.title,
//       video: video ?? this.video,
//       vote_average: vote_average ?? this.vote_average,
//       vote_count: vote_count ?? this.vote_count,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'adult': adult,
//       'backdrop_path': backdrop_path,
//       'genre_ids': genre_ids,
//       'id': id,
//       'original_language': original_language,
//       'original_title': original_title,
//       'overview': overview,
//       'popularity': popularity,
//       'poster_path': poster_path,
//       'release_date': release_date,
//       'title': title,
//       'video': video,
//       'vote_average': vote_average,
//       'vote_count': vote_count,
//     };
//   }

//   factory Result.fromMap(Map<String, dynamic> map) {
//     return Result(
//       adult: map['adult'] ?? false,
//       backdrop_path: map['backdrop_path'] ?? '',
//       genre_ids: List<int>.from(map['genre_ids']),
//       id: map['id']?.toInt() ?? 0,
//       original_language: map['original_language'] ?? '',
//       original_title: map['original_title'] ?? '',
//       overview: map['overview'] ?? '',
//       popularity: map['popularity']?.toDouble() ?? 0.0,
//       poster_path: map['poster_path'] ?? '',
//       release_date: map['release_date'] ?? '',
//       title: map['title'] ?? '',
//       video: map['video'] ?? false,
//       vote_average: map['vote_average']?.toDouble() ?? 0.0,
//       vote_count: map['vote_count']?.toInt() ?? 0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Result(adult: $adult, backdrop_path: $backdrop_path, genre_ids: $genre_ids, id: $id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, release_date: $release_date, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
//   }

//   @override
//   List<Object> get props {
//     return [
//       adult,
//       backdrop_path,
//       genre_ids,
//       id,
//       original_language,
//       original_title,
//       overview,
//       popularity,
//       poster_path,
//       release_date,
//       title,
//       video,
//       vote_average,
//       vote_count,
//     ];
//   }
// }
