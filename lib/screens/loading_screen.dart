import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';
import '../services//networking.dart';
import 'location_screen.dart';

const apiKey = 'dc392c84318340cff1103c6773fba415';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? longtitude;
  String? latitude;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getLocationdata();
  }

  void getLocationdata() async {
    Location location = Location();
    await location.getcurrentLocation();
    latitude = location.latitude.toString();
    longtitude = location.longtitude.toString();
    var url = Uri.http('api.openweathermap.org', 'data/2.5/weather', {
      'lat': latitude,
      'lon': longtitude,
      'appid': apiKey,
      'units': 'metric'
    });
    Networkhelper networkhelper = Networkhelper(url: url);
    var weatherdata = await networkhelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
