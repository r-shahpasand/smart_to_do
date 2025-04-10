import 'package:hive_flutter/hive_flutter.dart';

part 'priority.g.dart';

@HiveType(typeId: 1)
enum Priority{
  @HiveField(0)
  low(3),

  @HiveField(1)
  medium(2),

  @HiveField(2)
  high(1);

  const Priority(this.value);
  final num value;
}