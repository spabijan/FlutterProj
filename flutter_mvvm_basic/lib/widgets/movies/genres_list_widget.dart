import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/constants/my_app_constants.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (final String genre in MyAppConstants.genres)
          _makeCustomChip(genreName: genre, context: context)
      ],
    );
  }

  Widget _makeCustomChip(
          {required String genreName, required BuildContext context}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
              border: Border.all(color: Theme.of(context).colorScheme.surface)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              genreName,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
            ),
          ),
        ),
      );
}
