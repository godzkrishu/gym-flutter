import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:playground/routes/route.dart';
import 'package:playground/screens/home_screen.dart';
import 'models/workout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register the adapter
  Hive.registerAdapter(WorkoutAdapter());

  // Open the box
  await Hive.openBox<Workout>('workouts');
  final box = Hive.box<Workout>('workouts');
  // Seed only if empty
  if (box.isEmpty) {
    for (var workout in sampleWorkouts) {
      await box.put(workout.id, workout);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

final List<Workout> sampleWorkouts = [
  // MONDAY - Chest & Triceps
  Workout(
    id: 'mon1',
    name: 'Push Ups',
    description: 'Classic chest and triceps builder.',
    gifImg: 'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExejZnZmMwaGYzenR6YjE0dmR3aGVwc3htMzE2cmlwNHBibzV2bHp0ciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/mGWBjz74fn404BWUl4/giphy.gif',
    dayName: 'Monday',
  ),
  Workout(
    id: 'mon2',
    name: 'Bench Press',
    description: 'Targets the chest with heavy resistance.',
    gifImg: 'https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExa2V3aXpzOTFzMmYxMmRwb3AzYTlnOHN2bHBxY3B3NzB4d2U0NmxtMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/oxa540N5r9znP4nMYV/giphy.gif',
    dayName: 'Monday',
  ),
  Workout(
    id: 'mon3',
    name: 'Tricep Dips',
    description: 'Bodyweight exercise for triceps.',
    gifImg: 'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZW5wbGNmenF0YWFvOHhpcG9hM2lkbzhpZzR5bjJibWxzdzF4djdpNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/b4hNjbCD7cptHZV61y/giphy.gif',
    dayName: 'Monday',
  ),
  Workout(
    id: 'mon4',
    name: 'Incline Push Ups',
    description: 'Upper chest emphasis.',
    gifImg: 'https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExbHV3NTR3ZWZ4Y2Q0amI1MzNzbm13eGFjcmxqeHlqbWFrMTQ2dWNxbiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/GGfqjb6wTEYHtIdj2O/giphy.gif',
    dayName: 'Monday',
  ),
  Workout(
    id: 'mon5',
    name: 'Diamond Push Ups',
    description: 'Focuses on inner chest and triceps.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcWt3enJzYzB5a203NzA5NDFqOG5nNmwwbHFpYTVyeGIyNnk1cXd5bSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/srOogZJmCOFkymR1jo/giphy.gif',
    dayName: 'Monday',
  ),

  // TUESDAY - Back & Biceps
  Workout(
    id: 'tue1',
    name: 'Pull Ups',
    description: 'Excellent for back and biceps strength.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExc3ZpeTlod29pY3kzZnUyM3JwZ3ppb25zZmZxd3JpaHY4eWxrMWFjNyZlcD12MV9naWZzX3NlYXJjaCZjdD1n/14xa1F3aatkNhK/giphy.gif',
    dayName: 'Tuesday',
  ),
  Workout(
    id: 'tue2',
    name: 'Bent Over Rows',
    description: 'Strengthens mid-back and lats.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExaHVleHZiNWR1MXF1eWFydDV6cXFjNXN4d2xqbmJxeDczc2hkMm5tNiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/xThuWpDFsFdI0zstEc/giphy.gif',
    dayName: 'Tuesday',
  ),
  Workout(
    id: 'tue3',
    name: 'Bicep Curls',
    description: 'Isolated biceps exercise.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeW5kMW93OHdqOXRmcnA0N2FzaDFyNWtobDF1Y2ZjM3lzZzFoZGRiMCZlcD12MV9naWZzX3NlYXJjaCZjdD1n/Lh5tfasv0ReOFLcSTB/giphy.gif',
    dayName: 'Tuesday',
  ),
  Workout(
    id: 'tue4',
    name: 'Lat Pulldown',
    description: 'Machine exercise for lats and biceps.',
    gifImg: 'https://media1.tenor.com/m/AR6A1jMcnE8AAAAC/lat-pull-down.gif',
    dayName: 'Tuesday',
  ),
  Workout(
    id: 'tue5',
    name: 'Seated Rows',
    description: 'Strengthens entire back.',
    gifImg: 'https://media.tenor.com/R069mkP-46sAAAAM/cable-row-back.gif',
    dayName: 'Tuesday',
  ),

  // WEDNESDAY - Legs
  Workout(
    id: 'wed1',
    name: 'Squats',
    description: 'Fundamental leg builder.',
    gifImg: 'https://media1.tenor.com/m/1NY6qOs30XIAAAAC/goblet-squad.gif',
    dayName: 'Wednesday',
  ),
  Workout(
    id: 'wed2',
    name: 'Lunges',
    description: 'Targets quads and glutes.',
    gifImg: 'https://media.tenor.com/fWiC9Ze5eUMAAAAM/lunges-exercise.gif',
    dayName: 'Wednesday',
  ),
  Workout(
    id: 'wed3',
    name: 'Leg Press',
    description: 'Heavy compound machine movement.',
    gifImg: 'https://media.tenor.com/yBaS_oBgidsAAAAM/gym.gif',
    dayName: 'Wednesday',
  ),
  Workout(
    id: 'wed4',
    name: 'Calf Raises',
    description: 'Focuses on lower legs.',
    gifImg: 'https://media.tenor.com/hkCPKp1w8yQAAAAM/plantiflexi%C3%B3n-pantorrilla.gif',
    dayName: 'Wednesday',
  ),
  Workout(
    id: 'wed5',
    name: 'Bulgarian Split Squats',
    description: 'Unilateral leg strength and balance.',
    gifImg: 'https://media.tenor.com/5P_Ar_LX0DQAAAAM/split-squat-exercise.gif',
    dayName: 'Wednesday',
  ),

  // THURSDAY - Shoulders
  Workout(
    id: 'thu1',
    name: 'Overhead Press',
    description: 'Builds strong delts and triceps.',
    gifImg: 'https://media.tenor.com/CV1FfGVNpdcAAAAM/desenvolvimento-militar.gif',
    dayName: 'Thursday',
  ),
  Workout(
    id: 'thu2',
    name: 'Lateral Raises',
    description: 'Targets medial delts for width.',
    gifImg: 'https://media.giphy.com/media/xUPGcINgHwvNkUkb8w/giphy.gif',
    dayName: 'Thursday',
  ),
  Workout(
    id: 'thu3',
    name: 'Front Raises',
    description: 'Isolates anterior delts.',
    gifImg: 'https://media.tenor.com/-OavRqpxSaEAAAAM/eleva%C3%A7%C3%A3o-lateral.gif',
    dayName: 'Thursday',
  ),
  Workout(
    id: 'thu4',
    name: 'Reverse Flyes',
    description: 'Strengthens rear delts and upper back.',
    gifImg: 'https://media.tenor.com/HTvjufujuJAAAAAM/rear-raise-rear.gif',
    dayName: 'Thursday',
  ),
  Workout(
    id: 'thu5',
    name: 'Arnold Press',
    description: 'Dynamic shoulder builder.',
    gifImg: 'https://media.tenor.com/ZR-_3Mxq0gYAAAAM/arnold-press.gif',
    dayName: 'Thursday',
  ),

  // FRIDAY - Core & Abs
  Workout(
    id: 'fri1',
    name: 'Plank',
    description: 'Isometric core strength.',
    gifImg: 'https://media.tenor.com/7O6JimICFLoAAAAM/plank.gif',
    dayName: 'Friday',
  ),
  Workout(
    id: 'fri2',
    name: 'Russian Twists',
    description: 'Targets obliques.',
    gifImg: 'https://media.tenor.com/Fmh1xemYphAAAAAM/dumbbellrussiantwists.gif',
    dayName: 'Friday',
  ),
  Workout(
    id: 'fri3',
    name: 'Mountain Climbers',
    description: 'Dynamic core and cardio.',
    gifImg: 'https://media.tenor.com/21qUJXduNeQAAAA1/working-out-deshun-murrell.webp',
    dayName: 'Friday',
  ),
  Workout(
    id: 'fri4',
    name: 'Hanging Leg Raises',
    description: 'Lower abs focus.',
    gifImg: 'https://media.tenor.com/LuTjJGyFOoUAAAAM/hanging-leg-raise.gif',
    dayName: 'Friday',
  ),
  Workout(
    id: 'fri5',
    name: 'Bicycle Crunches',
    description: 'Complete ab engagement.',
    gifImg: 'https://media.tenor.com/Jopm0JiwtdsAAAAM/egsersiz.gif',
    dayName: 'Friday',
  ),

  // SATURDAY - Full Body Conditioning
  Workout(
    id: 'sat1',
    name: 'Burpees',
    description: 'Full body cardio and strength.',
    gifImg: 'https://media.tenor.com/HVa3Wh0CD8YAAAAM/funny-burpees.gif',
    dayName: 'Saturday',
  ),
  Workout(
    id: 'sat2',
    name: 'Jump Squats',
    description: 'Explosive leg and core work.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExc3dwb3NsM3A4anN0YmN2dDdreW93OGtqNGJnY3ZkN3o2Zmkybm9ydyZlcD12MV9naWZzX3NlYXJjaCZjdD1n/lYDyLbfbf6WuWCboPt/giphy.gif',
    dayName: 'Saturday',
  ),
  Workout(
    id: 'sat3',
    name: 'Kettlebell Swings',
    description: 'Hip power and conditioning.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcXp2Z2lmNGRrajhxNXM2cTM0azRud3VlcWhnaTZqdnYzN2g5Nnc0MSZlcD12MV9naWZzX3NlYXJjaCZjdD1n/cpIiirpxuqtCsf47WS/giphy.gif',
    dayName: 'Saturday',
  ),
  Workout(
    id: 'sat4',
    name: 'Battle Ropes',
    description: 'High intensity full body workout.',
    gifImg: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExeDhkNnA2cnF0bHRucDlkMWtrYzBoaGxkMXcwbGc3OWI2bGx0Mms5dyZlcD12MV9naWZzX3NlYXJjaCZjdD1n/XaL3I1ovy54FiluqWv/giphy.gif',
    dayName: 'Saturday',
  ),
  Workout(
    id: 'sat5',
    name: 'Box Jumps',
    description: 'Explosive plyometric movement.',
    gifImg: 'https://tenor.com/bAlvJ.gif',
    dayName: 'Saturday',
  ),

];

