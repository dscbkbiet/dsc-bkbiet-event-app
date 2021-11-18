import 'package:equatable/equatable.dart';

class EventsEntity extends Equatable {
  final String id;
  final String image;
  final String name;
  final String date;
  final String details;
  final String type;
  final String eventUrl;

  EventsEntity(
      {required this.id,
      required this.image,
      required this.name,
      required this.date,
      required this.details,
      required this.type,
      required this.eventUrl});

  @override
  List<Object> get props => [id];
}
