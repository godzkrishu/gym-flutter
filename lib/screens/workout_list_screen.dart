import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/workout.dart';
import 'detailed_screen.dart';

class ListWorkoutScreen extends StatelessWidget {
  const ListWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Workout>('workouts');

    return Scaffold(
      appBar: AppBar(title: const Text('All Workouts')),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Workout> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No workouts added yet.'));
          }

          final workouts = box.values.toList();

          return ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final workout = workouts[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

                child: ListTile(
                  title: Text(workout.name),
                  subtitle: Text(workout.description),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await box.delete(workout.id);
                      },
                    ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WorkoutDetailScreen(workout: workout),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
