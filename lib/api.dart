import 'package:url_launcher/url_launcher.dart';

class WhatsappAPI {
  sendMessage(int countryCode, int number, String message) async {
    String url =
        'https://api.whatsapp.com/send?phone=+$countryCode$number&text=$message';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
