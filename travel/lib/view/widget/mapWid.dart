/*import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class mapWid extends StatefulWidget {
  static const String route = 'map_controller_animated';

  const mapWid({Key? key}) : super(key: key);

  @override
  mapWidState createState() {
    return mapWidState();
  }
}

class mapWidState extends State<mapWid> with TickerProviderStateMixin {
  // Note the addition of the TickerProviderStateMixin here. If you are getting an error like
  // 'The class 'TickerProviderStateMixin' can't be used as a mixin because it extends a class other than Object.'
  // in your IDE, you can probably fix it by adding an analysis_options.yaml file to your project
  // with the following content:
  //  analyzer:
  //    language:
  //      enableSuperMixins: true
  // See https://github.com/flutter/flutter/issues/14317#issuecomment-366085869
  // This project didn't require that change, so YMMV.

  static final cairo = LatLng(26.820553, 30.802498);
  static final paris = LatLng(48.8566, 2.3522);
  static final rome = LatLng(41.902782, 12.496366);
  static final japan = LatLng(36.204824, 138.252924);
  static final sydney = LatLng(-33.865143, 151.209900);

  late final MapController mapController;
  AnimationController? _animationControllerPlane;
  Animation<double>? _planeAnimatio;
  var movingMarkerTween = Tween<LatLng>(begin: cairo, end: paris);

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _animationControllerPlane =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    _animationControllerPlane!.forward();
    _planeAnimatio = CurvedAnimation(
        parent: _animationControllerPlane!, curve: Curves.decelerate);
  }

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.

    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.addListener(() {
      mapController.move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation));
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('finished');
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });
    print('start');
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final markers = <Marker>[
      Marker(
          width: 60,
          height: 60,
          point: japan,
          builder: (ctx) => Image.asset('assets/icons/castle.png')),
      Marker(
          width: 60,
          height: 60,
          point: sydney,
          builder: (ctx) => Image.asset('assets/icons/building.png')),
      Marker(
          width: 60,
          height: 60,
          point: cairo,
          builder: (ctx) => Image.asset('assets/icons/pyramids.png')),
      Marker(
          width: 60,
          height: 60,
          point: rome,
          builder: (ctx) => Image.asset('assets/icons/pantheon.png')),
      Marker(
          width: 60,
          height: 60,
          point: paris,
          builder: (ctx) => Image.asset('assets/icons/eiffel-tower.png')),
      Marker(
          width: 40,
          height: 40,
          point: cairo,
          builder: (ctx) =>Image.asset('assets/icons/placeholder.png')),
          Marker(
          width: 40,
          height: 40,
          point: paris,
          builder: (ctx) =>Image.asset('assets/icons/placeholder (1).png')),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: _animationControllerPlane!,
        builder: (context, child) => Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text('Start'),CircleAvatar(radius: 5,backgroundColor: Colors.black,)],),
                      Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text('End'),CircleAvatar(radius: 5,backgroundColor: Color.fromARGB(255, 255, 0, 0),)],),
                      Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text('Route'),CircleAvatar(radius: 5,backgroundColor: Color.fromARGB(255, 0, 255, 81),)],),
                  ],
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        final bounds = LatLngBounds.fromPoints([
                          dublin,
                          paris,
                          london,
                        ]);
      
                        mapController.fitBounds(
                          bounds,
                          options: const FitBoundsOptions(
                            padding: EdgeInsets.only(left: 15, right: 15),
                          ),
                        );
                      },
                      child: const Text('Fit Bounds'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        final bounds = LatLngBounds.fromPoints([
                          dublin,
                          paris,
                          london,
                        ]);
      
                        final centerZoom =
                            mapController.centerZoomFitBounds(bounds);
                        _animatedMapMove(centerZoom.center, centerZoom.zoom);
                      },
                      child: const Text('Fit Bounds animated'),
                    ),
                  ],
                ),
              ),*/
              Container(
                child: Expanded(
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                        center: LatLng(51.5, -0.09),
                        zoom: 5,
                        maxZoom: 40,
                        minZoom: 3),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(markers: markers),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: [
                              cairo,
                              paris,
                             
                            ],
                            strokeWidth: 5,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/