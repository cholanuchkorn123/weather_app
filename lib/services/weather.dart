import './location.dart';
import './networking.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseUrl = 'api.openweathermap.org';
const path = 'data/2.5/weather';

class WeatherModel {
  Future<dynamic> getBycityname(String cityname) async {
    var url =
        Uri.http(baseUrl, path, {'q': cityname, 'appid': dotenv.env['apikey']});
    Networkhelper networkhelper = Networkhelper(url: url);
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    // ignore: unused_local_variable

    await location.getcurrentLocation();
    var url = Uri.http(baseUrl, path, {
      'lat': location.latitude.toString(),
      'lon': location.longtitude.toString(),
      'appid': dotenv.env['apikey'],
      'units': 'metric'
    });
    Networkhelper networkhelper = Networkhelper(url: url);
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
