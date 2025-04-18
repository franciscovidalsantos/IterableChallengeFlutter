import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iterable_challenge_flutter/models/workout.dart';

class FiterableService {
  final url = Uri.parse("https://iterable-assignment.vercel.app/api/workouts");

  Future<List<Workout>> fetchWorkouts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var fetchedWorkouts = Workout.fromJson(json);
        return fetchedWorkouts;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error occurred during the request: $e");
    }
  }
}
