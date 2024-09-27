import 'package:http/http.dart' as http;

class CourseService {
  Future<http.Response> getCourse() async {
    final url = Uri.parse('https://api.vantharr.in/courses/site-course-list/');
    final response = await http.get(url);
    return response;
  }
}
