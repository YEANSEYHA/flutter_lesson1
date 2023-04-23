import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<void> openWebsite(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> searchInfo(String query) async {
    try {
      await launchUrl(Uri.parse("https://www.google.com/search?q=$query"));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> sendEmail(String email) async {
    try {
      await launchUrl(Uri.parse("mailto:$email"));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> sendSMS(String tel) async {
    try {
      await launchUrl(Uri.parse("sms:$tel"));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> call(String tel) async {
    try {
      await launchUrl(Uri.parse("tel:$tel"));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
