import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class XImageNetwork extends StatelessWidget {
  const XImageNetwork({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.fit,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String imageUrl;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius,
            child: _buildImage(),
          )
        : _buildImage();
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      imageUrl: imageUrl,
      width: width,
      height: height,
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/error_image.png',
        width: width ?? 100.0,
        height: height ?? 100.0,
      ),
    );
  }
}
