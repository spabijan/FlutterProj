import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class StoryList extends StatelessWidget {
  StoryList(
      {super.key,
      required List<StoryViewModel> stories,
      void Function(StoryViewModel)? onSelected})
      : _stories = stories,
        _onSelected = onSelected ?? ((_) => {});

  final List<StoryViewModel> _stories;
  final void Function(StoryViewModel) _onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _stories.length,
      itemBuilder: (context, index) {
        final story = _stories[index];
        return ListTile(
          onTap: () => _onSelected(story),
          title: Text(
            story.title,
            style: TextStyle(fontSize: 20),
          ),
          trailing: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                '${story.numOfComments}',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )),
        );
      },
    );
  }
}
