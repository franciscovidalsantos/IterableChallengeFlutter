import 'package:flutter/material.dart';
import 'package:iterable_challenge_flutter/models/workout.dart';
import 'package:iterable_challenge_flutter/screens/details.dart';
import 'package:iterable_challenge_flutter/services/fiterable_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _fiterableService = FiterableService();
  List<Workout> _workouts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Fetch data from the API and update the state
    _requestWorkouts();
  }

  Future<void> _requestWorkouts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final workouts = await _fiterableService.fetchWorkouts();
      setState(() {
        _workouts = workouts;
      });
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fiterable'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _workouts.length,
                itemBuilder: (context, index) {
                  final workout = _workouts[index];

                  return SizedBox(
                    child: ListTile(
                      title: Text(workout.title),
                      subtitle: Text(workout.difficulty),
                      leading: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 20,
                        // TODO: replace with image if any
                        child: Text(workout.title[0]),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${workout.duration.inMinutes}min"),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (builder) => DetailsScreen(workout: workout),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
    );
  }
}
