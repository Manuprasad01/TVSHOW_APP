class CastModel {
  final int personId;
  final String personName;
  final String? personUrl;
  final String? personCountry;
  final String? personCountryCode;
  final String? personTimezone;
  final String? personBirthday;
  final String? personDeathday;
  final String? personGender;
  final String? personImage;

  final int characterId;
  final String characterName;
  final String? characterUrl;
  final String? characterImage;

  final bool isSelf;
  final bool isVoice;

  CastModel({
    required this.personId,
    required this.personName,
    this.personUrl,
    this.personCountry,
    this.personCountryCode,
    this.personTimezone,
    this.personBirthday,
    this.personDeathday,
    this.personGender,
    this.personImage,
    required this.characterId,
    required this.characterName,
    this.characterUrl,
    this.characterImage,
    required this.isSelf,
    required this.isVoice,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      personId: json['person']['id'],
      personName: json['person']['name'],
      personUrl: json['person']['url'],
      personCountry: json['person']['country']?['name'],
      personCountryCode: json['person']['country']?['code'],
      personTimezone: json['person']['country']?['timezone'],
      personBirthday: json['person']['birthday'],
      personDeathday: json['person']['deathday'],
      personGender: json['person']['gender'],
      personImage: json['person']['image']?['medium'],

      characterId: json['character']['id'],
      characterName: json['character']['name'],
      characterUrl: json['character']['url'],
      characterImage: json['character']['image']?['medium'],

      isSelf: json['self'],
      isVoice: json['voice'],
    );
  }
}
