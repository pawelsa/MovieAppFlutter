import 'dart:convert';

ApiCredits apiCreditsFromJson(String str) =>
    ApiCredits.fromJson(json.decode(str));

class ApiCredits {
  ApiCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  final int id;
  final List<ApiPerson> cast;
  final List<ApiPerson> crew;

  factory ApiCredits.fromJson(Map<String, dynamic> json) {
    return ApiCredits(
      id: json["id"],
      cast:
          List<ApiPerson>.from(json["cast"].map((x) => ApiPerson.fromJson(x))),
      crew:
          List<ApiPerson>.from(json["crew"].map((x) => ApiPerson.fromJson(x))),
    );
  }
}

class ApiPerson {
  ApiPerson({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.order,
    required this.department,
    required this.job,
    required this.creditId,
  });

  ApiPerson.empty()
      : id = -1,
        name = "Unknown",
        profilePath = null,
        character = null,
        order = -1,
        department = null,
        job = null,
        creditId = "";

  final int id;
  final String name;
  final String? profilePath;
  final String? character;
  final int? order;
  final String? department;
  final String? job;
  final String creditId;

  factory ApiPerson.fromJson(Map<String, dynamic> json) =>
      ApiPerson(
        id: json["id"],
        name: json["name"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        character: json["character"] == null ? null : json["character"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
        creditId: json['credit_id'],
      );
}
