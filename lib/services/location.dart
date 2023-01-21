import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtitude;
 Future <void> getcurrentLocation() async {
    try {
      //จำเป็นต้องมีสองอันนี้ไวเช๊คไม่งั้นแตก//
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      //ข้างบน//
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longtitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
