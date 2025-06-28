import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../models/workout.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _gifImgController = TextEditingController();
  final _dayNameController = TextEditingController();
  String selectedCategory = 'Chest';

  void _saveWorkout() async {
    if (_formKey.currentState!.validate()) {
      final id = const Uuid().v4();
      final workout = Workout(
        id: id,
        name: _nameController.text,
        description: _descriptionController.text,
        gifImg: _gifImgController.text,
        dayName: _dayNameController.text,
      );

      final box = Hive.box<Workout>('workouts');
      await box.put(id, workout);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workout saved!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Workout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => value == null || value.isEmpty ? 'Enter description' : null,
              ),
              TextFormField(
                controller: _gifImgController,
                decoration: const InputDecoration(labelText: 'Gif Image URL'),
                validator: (value) => value == null || value.isEmpty ? 'Enter gif URL' : null,
              ),
              TextFormField(
                controller: _dayNameController,
                decoration: const InputDecoration(labelText: 'Day Name'),
                validator: (value) => value == null || value.isEmpty ? 'Enter day name' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveWorkout,
                child: const Text('Save Workout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
