import 'package:flutter/material.dart';
import '../model/photo.dart';

class PhotoCell extends StatelessWidget {
  @override
  final Photo photo;
  const PhotoCell(this.photo);

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(padding: EdgeInsets.all(10),
      child: Container(alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: ClipRRect(borderRadius: BorderRadius.circular(10),
          child: Hero(tag: 'image${photo.id}',
            child: FadeInImage.assetNetwork(placeholder: "assets/images/no-image.png", image: photo.thumbnailUrl,
            width: 100,
            height: 100,),)))
        ],
      ),),),
    );
  }
}
