class Events {
  String id;
  String image;
  String name;
  String date;
  String details;
  String type;
  String eventUrl;

  Events(
      {this.id,
      this.image,
      this.name,
      this.date,
      this.details,
      this.type,
      this.eventUrl});

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
