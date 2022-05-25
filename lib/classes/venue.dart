import 'dart:convert';

class Venue {
  Venue({
    this.id,
    this.name,
    this.surface,
    this.address,
    this.city,
    this.capacity,
    this.imagePath,
    this.coordinates,
  });

  final int? id;
  final String? name;
  final dynamic surface;
  final dynamic address;
  final String? city;
  final int? capacity;
  final String? imagePath;
  final String? coordinates;

  factory Venue.fromRawJson(String str) => Venue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        surface: json["surface"],
        address: json["address"],
        city: json["city"],
        capacity: json["capacity"],
        imagePath: json["image_path"],
        coordinates: json["coordinates"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surface": surface,
        "address": address,
        "city": city,
        "capacity": capacity,
        "image_path": imagePath,
        "coordinates": coordinates,
      };
}
