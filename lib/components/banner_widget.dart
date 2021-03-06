import 'package:flutter/material.dart';


class BannerWidget extends StatelessWidget {
  final String imagePath;
  final bool isFavorited;
  final int index;

  BannerWidget({this.imagePath, this.isFavorited, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: 'image${index}',
            child: ClipRRect(
              child: Image.asset(imagePath ?? 'images/example_image.jpg'),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red[500],
              ),
              onPressed: () => null,
            ),
            right: 0,
          ),
        ],
      ),
    );
  }
}
