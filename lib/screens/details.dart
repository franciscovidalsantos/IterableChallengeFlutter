import 'package:flutter/material.dart';
import 'package:iterable_challenge_flutter/models/workout.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.workout});
  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Card(
            elevation: 10,
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              workout.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
              width: double.infinity,
              height: workout.imageHeight * 0.5,
              errorBuilder: (context, error, stackTrace) => SizedBox(),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text("Description"),
            subtitle: Text(workout.description),
          ),
          ListTile(title: Text("Category"), subtitle: Text(workout.category)),
          ListTile(
            title: Text("Instructor"),
            subtitle: Text(workout.instructor),
          ),
        ],
      ),
    );
  }
}
