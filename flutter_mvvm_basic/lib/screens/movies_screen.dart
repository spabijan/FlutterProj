import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';
import 'package:flutter_mvvm_basic/data/repositories/movies_repository_protocol.dart';
import 'package:flutter_mvvm_basic/model/genre.dart';
import 'package:flutter_mvvm_basic/screens/favourite_screen.dart';
import 'package:flutter_mvvm_basic/services/api_services_protocol.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:flutter_mvvm_basic/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  int _currentPage = 1;
  bool _isFetching = false;
  final List<MovieViewModel> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      setState(() => _currentPage++);
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    if (_isFetching) return;
    setState(() => _isFetching = true);

    try {
      final List<MovieViewModel> movies =
          await getIt<MoviesRepositoryProtocol>()
              .fetchMovies(page: _currentPage);
      setState(() => _movies.addAll(movies));
    } catch (error) {
      getIt<NavigationUtils>().showSnackbar(Text(
        'Error while fetching data from web $error',
        style: TextStyle(color: Colors.white),
      ));
    } finally {
      setState(() => _isFetching = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Popular Movies'),
          actions: [
            IconButton(
              onPressed: () {
                getIt<NavigationUtils>().navigate(FavouriteScreen());
              },
              icon: const Icon(Icons.favorite_rounded),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () async {
                final List<Genre> movies =
                    await getIt<ApiServicesProtocol>().fetchGenres();
              },
              icon: const Icon(Icons.dark_mode),
            )
          ],
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: _movies.length + (_isFetching ? 1 : 0),
          itemBuilder: (context, index) => index < _movies.length
              ? MoviesWidget(movie: _movies[index])
              : CircularProgressIndicator.adaptive(),
        ));
  }
}
