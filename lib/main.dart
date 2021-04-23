import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

List<LatLng> points = [];
List<Marker> markerlist = [];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map Application',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Map Application'),
        ),
        body: Stack(
          children: <Widget>[
            new FlutterMap(
                options: new MapOptions(
                    minZoom: 10.0,
                    center: new LatLng(40.71, -74.00),
                    onLongPress: (point) => create(point)),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  new MarkerLayerOptions(markers: markerlist)
                ])
          ],
        ),
      ),
    ));
void setmarkers() {}
void addposition(point) {
  print("position is" +
      point.latitude.toString() +
      " " +
      point.longitude.toString());
}

add(point) {
  points.add(point);
  addposition(point);
  print(points);
  markerlist.add(point);
}

void create(LatLng point) {
  Marker mark = new Marker(
      width: 45.0,
      height: 45.0,
      point: new LatLng(point.latitude, point.latitude),
      builder: (context) => new Container(
            child: IconButton(
                icon: Icon(Icons.map),
                onPressed: () {
                  print('Marker tapped!');
                }),
          ));
  markerlist.add(mark);
  print("added" + mark.toString());
  points.forEach((element) => add(element));
}
