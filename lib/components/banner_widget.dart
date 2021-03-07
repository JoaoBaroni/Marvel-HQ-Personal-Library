import 'package:flutter/material.dart';
import 'package:hq_personal_library/model/comic.dart';
import 'package:hq_personal_library/provider/app_data.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:hq_personal_library/utils/typesEnum.dart';
import 'package:provider/provider.dart';


class BannerWidget extends StatefulWidget {
  final String imagePath;
  final bool isFavorited;
  final int index;
  final Comic comic;
  final bool showFavorite;

  BannerWidget({this.imagePath, this.isFavorited, this.index, this.comic, this.showFavorite});

  @override
  _BannerWidgetState createState() => _BannerWidgetState(isFavorited: isFavorited, showFavorite: showFavorite);
}

class _BannerWidgetState extends State<BannerWidget> {
  bool isFavorited;
  bool showFavorite;

  _BannerWidgetState({this.isFavorited, this.showFavorite = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: 'image${widget.index}',
            child: ClipRRect(
              child: widget.imagePath != null ? Image.network(widget.imagePath, fit: BoxFit.fill, repeat: ImageRepeat.repeatY, height: 170, width: 170,) : Image.asset('images/example_image.jpg'),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          showFavorite ? Positioned(
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: !isFavorited ? Colors.white54 : Colors.redAccent,
              ),
              onPressed: () {
                if(isFavorited){
                  Provider.of<AppData>(context, listen: false).removeComicFromFavorite(widget.comic);
                  setState(() {
                    isFavorited = false;
                  });
                }else{
                  Provider.of<AppData>(context, listen: false).addNewComicToFavorite(widget.comic);
                  setState(() {
                    isFavorited = true;
                  });
                }
              },
            ),
            right: 0,
          ): Text(''),
        ],
      ),
    );
  }
}
