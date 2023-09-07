import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String flag;
  String time = '';
  bool isDaytime = false;

  WorldTime({required this.location, required this.url, required this.flag});
  
  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 21 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = '----';
    }
  }
}