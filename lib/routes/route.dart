import 'package:go_router/go_router.dart';

import '../screens/create_workout_screen.dart';
import '../screens/home_screen.dart';
import '../screens/workout_list_screen.dart';

class AppRoute{
  static const  String createWorkoutScreen = "/workout_list";
  static const  String workoutListScreen = "/create_workout";
}
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: AppRoute.createWorkoutScreen,
      builder: (context, state) => CreateWorkoutScreen(),
    ),
    GoRoute(
      path: AppRoute.workoutListScreen,
      builder: (context, state) =>  ListWorkoutScreen(),
    ),

  ]

);