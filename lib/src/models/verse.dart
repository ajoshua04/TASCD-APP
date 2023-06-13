import 'dart:convert';

Verse verseFromJson(String str) => Verse.fromJson(json.decode(str));

String verseToJson(Verse data) => json.encode(data.toJson());

class Verse {
  String? id;
  String? htmil;

  Verse({
    this.id,
    this.htmil,
  });

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        htmil: json["html"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "html": htmil,
      };
}
