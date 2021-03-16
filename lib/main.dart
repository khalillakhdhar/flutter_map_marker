import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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
                  center: new LatLng(33.88, 9.53),
                  onLongPress: (point) => print("position is" +
                      point.latitude.toString() +
                      " " +
                      point.longitude.toString()),
                ),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c']),
                  new MarkerLayerOptions(markers: [
                    new Marker(
                        width: 45.0,
                        height: 45.0,
                        point: new LatLng(33.88, 9.53),
                        builder: (context) => new Container(
                              child: IconButton(
                                  icon: Icon(Icons.map),
                                  onPressed: () {
                                    print('Marker tapped!');
                                  }),
                            ))
                  ])
                ])
          ],
        ),
      ),
    ));
