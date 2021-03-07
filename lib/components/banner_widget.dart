import 'package:flutter/material.dart';
import 'package:hq_personal_library/utils/colors.dart';


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
              child: imagePath != null ? Image.network(imagePath, fit: BoxFit.fill, repeat: ImageRepeat.repeatY, height: 170, width: 170,) : Image.asset('images/example_image.jpg'),// : Image.asset('images/example_image.jpg'),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white54,
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
