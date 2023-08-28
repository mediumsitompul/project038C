import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogle1 extends StatelessWidget {
  String lat1a, lng1a;

  MyGoogle1({super.key, required this.lat1a, required this.lng1a});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Google Map")),
        ),
        body: MyGoogle2(lat1b: lat1a, lng1b: lng1a),
      ),
    );
  }
}

class MyGoogle2 extends StatefulWidget {
  String lat1b, lng1b;

  MyGoogle2({super.key, required this.lat1b, required this.lng1b});

  @override
  State<MyGoogle2> createState() => _MyGoogle2State();
}

class _MyGoogle2State extends State<MyGoogle2> {


  BitmapDescriptor markerIcon1 = BitmapDescriptor.defaultMarker;
  void addCustomeIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/images/marker_bola80.png",
    ).then((icon) {
      setState(() {
        markerIcon1 = icon;
      });
    });
  }

  @override
  void initState() {
    addCustomeIcon();

    double _lat1 = double.parse('${widget.lat1b.toString()}');
    double _lng1 = double.parse('${widget.lng1b.toString()}');
    LatLng _showLocation = LatLng(_lat1, _lng1);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse('${widget.lat1b.toString()}'),
                double.parse('${widget.lng1b.toString()}'),
              ),
              zoom: 12,
            ),
            markers: {
              Marker(
                markerId: MarkerId("1"),
                position: LatLng(
                  double.parse('${widget.lat1b.toString()}'),
                  double.parse('${widget.lng1b.toString()}'),
                ),
                infoWindow: InfoWindow(
                    title: "Title1: ${widget.lat1b}",
                    snippet: "Snippet1: ${widget.lng1b}"),
                icon: markerIcon1,
                anchor: Offset(0.5, 0.5),
              )
            },
            circles: {
              Circle(
                circleId: CircleId("1"),
                center: LatLng(
                  double.parse('${widget.lat1b.toString()}'),
                  double.parse('${widget.lng1b.toString()}'),
                ),
                radius: 5000,
                strokeColor: Colors.blue,
                fillColor: Colors.black12,
              )
            },
          ),
          Positioned(
            height: 60,
            width: 260,
            bottom: 60,
            left: 70,
            child: Card(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Latitude: ${widget.lat1b}'),
                    Text('Longitude: ${widget.lng1b}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
