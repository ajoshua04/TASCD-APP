import 'dart:convert';

AppConfiguration appConfigurationFromJson(String str) =>
    AppConfiguration.fromJson(json.decode(str));

String appConfigurationToJson(AppConfiguration data) =>
    json.encode(data.toJson());

class AppConfiguration {
  String fontFamily;
  String fontSize;
  String fire;
  String theme;

  AppConfiguration({
    required this.fontFamily,
    required this.fontSize,
    required this.fire,
    required this.theme,
  });

  factory AppConfiguration.fromJson(Map<String, dynamic> json) =>
      AppConfiguration(
        fontFamily: json["fontFamily"],
        fontSize: json["fontSize"],
        fire: json["fire"],
        theme: json["theme"],
      );

  Map<String, dynamic> toJson() => {
        "fontFamily": fontFamily,
        "fontSize": fontSize,
        "fire": fire,
        "theme": theme,
      };
}
