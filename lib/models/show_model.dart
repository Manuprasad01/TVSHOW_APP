class ShowModel {
  final int id;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int runtime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final String? image;
  final double? rating;
  final String? summary;
  final String? scheduleTime;
  final List<String>? scheduleDays;

  ShowModel({
    required this.id,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.image,
    this.rating,
    this.summary,
    this.scheduleTime,
    this.scheduleDays,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    return ShowModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      language: json['language'],
      genres: List<String>.from(json['genres']),
      status: json['status'],
      runtime: json['runtime'] ?? 0,
      premiered: json['premiered'],
      ended: json['ended'],
      officialSite: json['officialSite'],
      image: json['image']?['medium'],
      rating: json['rating']?['average']?.toDouble(),
      summary: json['summary'],
      scheduleTime: json['schedule']?['time'],
      scheduleDays: List<String>.from(json['schedule']?['days'] ?? []),
    );
  }
}
