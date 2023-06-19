import 'dart:convert';

Diary diaryFromJson(String str) => Diary.fromJson(json.decode(str));

String diaryToJson(Diary data) => json.encode(data.toJson());

class Diary {
  String? verseName;
  String? verseDate;
  String? verseDateFormatted;
  String? verseHtml;
  String? qtdd;

  Diary({
    this.verseName,
    this.verseDate,
    this.verseDateFormatted,
    this.verseHtml,
    this.qtdd,
  });

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        verseName: json["verseName"],
        verseDate: json["verseDate"],
        verseDateFormatted: json["verseDateFormatted"],
        verseHtml: json["verseHTML"],
        qtdd: json["qtdd"],
      );

  Map<String, dynamic> toJson() => {
        "verseName": verseName,
        "verseDate": verseDate,
        "verseDateFormatted": verseDateFormatted,
        "verseHtml": verseHtml,
        "qtdd": qtdd,
      };
}
