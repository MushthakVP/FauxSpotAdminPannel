import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../util/colors.dart';

class OverviewSmallImage extends StatelessWidget {
  const OverviewSmallImage({
    Key? key,
    required this.image,
    this.height = 120,
    this.width = 120,
  }) : super(key: key);

  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: grey,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
        image: DecorationImage(
          image: CachedNetworkImageProvider(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
