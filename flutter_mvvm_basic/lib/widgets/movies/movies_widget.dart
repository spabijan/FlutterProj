import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/constants/my_app_urls.dart';
import 'package:flutter_mvvm_basic/widgets/cached_image.dart';
import 'package:flutter_mvvm_basic/widgets/movies/favourite_button_wiget.dart';
import 'package:flutter_mvvm_basic/widgets/movies/genres_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedImage(
                      imageUrl: MyAppUrls.fightClubImage,
                      width: 70,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Movie Title',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GenresListWidget(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('8/10')
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.greenAccent,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Release date',
                              style: TextStyle(color: Colors.grey)),
                          Spacer(),
                          FavouriteButtonWidget()
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
