import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude,double longitude)async{
    String googleMapUrl = "https://wwww.google.com/maps/search/?api=1&query=$latitude,$longitude";
    // ignore: deprecated_member_use
    if(await canLaunch(googleMapUrl)){
      // ignore: deprecated_member_use
      await launch(googleMapUrl);
    }
    else{
      throw 'Could not open the Map';
    }
  }
}