class JokeModel {
  bool? error;
  String? category;
  String? type;
  String? setup;
  String? delivery;
  Flags? flags;
  int? id;
  bool? safe;
  String? lang;

  JokeModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    category = json['category'];
    type = json['type'];
    setup = json['setup'];
    delivery = json['delivery'];
    flags = json['flags'] != null ? new Flags.fromJson(json['flags']) : null;
    id = json['id'];
    safe = json['safe'];
    lang = json['lang'];
  }
}

class Flags {
  bool? nsfw;
  bool? religious;
  bool? political;
  bool? racist;
  bool? sexist;
  bool? explicit;

  Flags.fromJson(Map<String, dynamic> json) {
    nsfw = json['nsfw'];
    religious = json['religious'];
    political = json['political'];
    racist = json['racist'];
    sexist = json['sexist'];
    explicit = json['explicit'];
  }


}
