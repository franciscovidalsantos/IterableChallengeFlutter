class Workout {
  final String id;
  final String title;
  final String category;
  final Duration duration;
  final String difficulty;
  final String description;
  final String instructor;
  final String imageUrl;
  final int imageWidth;
  final int imageHeight;

  Workout({
    required this.id,
    required this.title,
    required this.category,
    required this.duration,
    required this.difficulty,
    required this.description,
    required this.instructor,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
  });

  static List<Workout> fromJson(Map<String, dynamic> json) {
    List<dynamic> workouts = json["workouts"];
    return workouts.map((workout) {
      return Workout(
        id: workout['id'],
        title: workout['title'],
        category: workout['category'],
        duration: Duration(minutes: workout["duration"]),
        difficulty: workout['difficulty'],
        description: workout['description'],
        instructor: workout['instructor'],
        imageUrl: workout['imageUrl'],
        imageWidth: workout['imageWidth'],
        imageHeight: workout['imageHeight'],
      );
    }).toList();
  }
}
