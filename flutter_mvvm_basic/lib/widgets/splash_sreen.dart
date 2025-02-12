import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/data/repositories/movies_repository_protocol.dart';
import 'package:flutter_mvvm_basic/screens/movies_screen.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';
import 'package:flutter_mvvm_basic/widgets/custom_error_widget.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final _moviesRepository = getIt<MoviesRepositoryProtocol>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      await _moviesRepository.fetchGenres();
      await getIt<NavigationUtils>().navigateReplace(MoviesScreen());
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(),
                SizedBox(
                  height: 16,
                ),
                Text('Loading...')
              ],
            ))
          : CustomErrorWidget(errorText: _errorMessage, retry: _loadData),
    );
  }
}
