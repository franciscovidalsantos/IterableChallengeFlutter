import 'package:flutter/material.dart';
import 'package:iterable_challenge_flutter/screens/details.dart';
import 'package:iterable_challenge_flutter/services/fiterable_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _fiterableService = FiterableService();

  @override
  void initState() {
    super.initState();
    // Fetch data from the API and update the state
    _fiterableService.fetchWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fiterable'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return SizedBox(
            child: ListTile(
              title: Text("title"),
              subtitle: Text("subtitle"),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 20,
                child: Text("${index + 1}"),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("minutes"),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => DetailsScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
