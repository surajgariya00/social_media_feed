import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:social_media_feed/Data/dummy_daata.dart';

class PostApiProvider {
  static const String _baseUrl = 'https://6603bb2b2393662c31cf8170.mockapi.io';

  static Future<List<Post>> fetchPosts() async {
    const url = '$_baseUrl/id';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
      throw error;
    }
  }
}
