import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/blog.dart';
import '../models/user_post.dart';

class BlogService {
  final String baseUrl = 'https://67ee3b10c11d5ff4bf78cd2a.mockapi.io/blogs';

  // Blog verilerini (contents endpoint) çekmek için
  Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/contents'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Blog.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      throw Exception('Error fetching blogs: $e');
    }
  }

  // UserPost verilerini (articles endpoint) çekmek için
  Future<List<UserPost>> fetchUserPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/articles'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => UserPost.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load user posts');
      }
    } catch (e) {
      throw Exception('Error fetching user posts: $e');
    }
  }
}
