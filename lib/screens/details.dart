import 'package:flutter/material.dart';
import 'package:iterable_challenge_flutter/models/workout.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.workout});
  final Workout workout;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _imageExists = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkImage();
  }

  void _checkImage() async {
    await Future.delayed(Duration(seconds: 1));

    final image = NetworkImage(widget.workout.imageUrl);
    image
        .resolve(ImageConfiguration())
        .addListener(
          ImageStreamListener(
            (info, _) {
              setState(() {
                _imageExists = true;
                _isLoading = false;
              });
            },
            onError: (error, stackTrace) {
              setState(() {
                _imageExists = false;
                _isLoading = false;
              });
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_imageExists) ...[
                    Card(
                      elevation: 10,
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        widget.workout.imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.topRight,
                        width: double.infinity,
                        height: widget.workout.imageHeight * 0.5,
                      ),
                    ),
                  ],

                  SizedBox(height: 20),
                  ListTile(
                    title: Text("Description"),
                    subtitle: Text(widget.workout.description),
                  ),
                  ListTile(
                    title: Text("Category"),
                    subtitle: Text(widget.workout.category),
                  ),
                  ListTile(
                    title: Text("Instructor"),
                    subtitle: Text(widget.workout.instructor),
                  ),
                ],
              ),
    );
  }
}
