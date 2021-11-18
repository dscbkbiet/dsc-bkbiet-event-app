import 'package:dsc_event/domain/entities/events_entity.dart';

class Events extends EventsEntity {
  final String id;
  final String image;
  final String name;
  final String date;
  final String details;
  final String type;
  final String eventUrl;

  Events(
      {required this.id,
      required this.image,
      required this.name,
      required this.date,
      required this.details,
      required this.type,
      required this.eventUrl})
      : super(
            id: id,
            image: image,
            name: name,
            date: date,
            details: details,
            type: type,
            eventUrl: eventUrl);

  factory Events.fromJson(Map<dynamic, dynamic> value) {
    return Events(
      id: value["id"],
      image: value["image"],
      name: value["name"],
      date: value["date"],
      details: value["details"],
      type: value["type"],
      eventUrl: value["eventUrl"],
    );
  }

  toJson() {
    return {
      "id": id,
      "image": image,
      "name": name,
      "date": date,
      "details": details,
      "type": type,
      "eventUrl": eventUrl,
    };
  }
}
