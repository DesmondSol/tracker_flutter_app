import 'package:flutter/material.dart';
import 'photo.dart';

class Detail extends StatefulWidget {
  final Photo photo;
  Detail({required this.photo});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('channel name'),
          backgroundColor: Color(0xFFFF00FF),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'image${widget.photo.id}',
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/no-image.png',
                    image: widget.photo.url),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  child: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ),
        ));
  }
}
