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
      {this.id,
      this.image,
      this.name,
      this.date,
      this.details,
      this.type,
      this.eventUrl})
      : super(
            id: id,
            image: image,
            name: name,
            date: date,
            details: details,
            type: type,
            eventUrl: eventUrl);

  factory Events.fromJson(Map<String, dynamic> value) {
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
