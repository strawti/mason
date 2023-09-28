import 'package:flutter/material.dart';

class AppImageNetworkWidget extends StatelessWidget {
  final String urlImage;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? scale;
  final Animation<double>? opacity;
  final FilterQuality filterQuality;

  const AppImageNetworkWidget(
    this.urlImage, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.opacity,
    this.scale,
    this.filterQuality = FilterQuality.low,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      height: height,
      width: width,
      fit: fit,
      scale: scale ?? 1,
      opacity: opacity,
      filterQuality: filterQuality,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/nodata.png',
          height: (height ?? 135) * 0.85,
        );
      },
    );
  }
}
