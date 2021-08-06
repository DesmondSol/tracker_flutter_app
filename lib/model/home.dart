import 'package:flutter/material.dart';
import 'package:sol_flutter_app/cell/grid_cell.dart';
import 'package:sol_flutter_app/network/network_requiest.dart';
import 'photo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  gridView(AsyncSnapshot<List<Photo>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: PhotoCell(photo),
            ),
            onTap: () {
              gotoDetailpage(context, photo);
            },
          );
        }).toList(),
      ),
    );
  }

  gotoDetailpage(BuildContext context, Photo photo) {}

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Photo>>(
              future: NetworkRequest.fetchPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return gridView(snapshot);
                }
                return circularProgress();
              },
            ),
          )
        ],
      ),
    );
  }
}
