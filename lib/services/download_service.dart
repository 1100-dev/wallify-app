import 'dart:typed_data';
import 'package:http/http.dart' as http;

class DownloadService {

  static Future<Uint8List?> downloadImageBytes(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}