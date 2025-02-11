import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/constants/my_app_constants.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.boxFit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      height:
          height ?? size.height * MyAppConstants.screenImageDefaultHeightRatio,
      width: width ?? size.width * MyAppConstants.screenImageDefaultWidthRatio,
      imageUrl: imageUrl,
      fit: boxFit ?? BoxFit.cover,
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
