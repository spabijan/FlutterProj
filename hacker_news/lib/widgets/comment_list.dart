import 'dart:math';
import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_view_model.dart';
import 'package:html_unescape/html_unescape.dart';

class CommentList extends StatelessWidget {
  CommentList({super.key, required List<CommentViewModel> comments})
      : _comments = comments;

  final List<CommentViewModel> _comments;
  final unescape = HtmlUnescape();

  String _formatCommentText(String text) {
    final formattedText = unescape.convert(text);
    return formattedText.isNotEmpty
        ? formattedText.substring(0, min(200, formattedText.length))
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (_, index) => ListTile(
              leading: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.orange,
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white),
                  )),
              title: Text(unescape.convert(_comments[index].title)),
            ));
  }
}
