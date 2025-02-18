import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/riverpod/favourites/favorites_provider.dart';
import 'package:mvvm_statemanagements/riverpod/movies/movies_provider.dart';
import 'package:mvvm_statemanagements/screens/movies_screen.dart';
import 'package:mvvm_statemanagements/service/init_getit.dart';
import 'package:mvvm_statemanagements/service/navigation_service.dart';
import 'package:mvvm_statemanagements/widgets/my_error_widget.dart';

final initializationProvider = FutureProvider.autoDispose((ref) async {
  ref.keepAlive();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(favouritesProvider.notifier).loadFavorites();
    ref.read(moviesProvider.notifier).getMovies();
  });
});

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataLoader = ref.watch(initializationProvider);

    return Scaffold(
      body: dataLoader.when(
          data: (_) {
            WidgetsBinding.instance.addPostFrameCallback((_) =>
                getIt<NavigationService>().navigateReplace(MoviesScreen()));
            return SizedBox.shrink();
          },
          error: (error, stacktrace) => MyErrorWidget(
              errorText: error.toString(),
              retryFunction: () => ref.refresh(initializationProvider)),
          loading: () => CircularProgressIndicator.adaptive()),
    );
  }
}
