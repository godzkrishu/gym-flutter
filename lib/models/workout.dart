import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';
part 'workout.g.dart';

@freezed
@HiveType(typeId: 0)
class Workout with _$Workout {
  const factory Workout({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required String gifImg,
    @HiveField(4) @JsonKey(name: 'day_name') required String dayName,
  }) = _Workout;

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
}
