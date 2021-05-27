class GameMatch {
  int? id;
  String? type;
  String? title;
  String? description;
  String? location;
  DateTime? startDate;
  DateTime? endDate;
  String? image;

  GameMatch({
    this.id,
    this.type,
    this.title,
    this.description,
    this.location,
    this.startDate,
    this.endDate,
    this.image,
  });

  factory GameMatch.fromJson(Map<String, dynamic> json) => GameMatch(
      id: json['id'] ?? null,
      type: json['type'] ?? null,
      title: json['title'] ?? null,
      description: json['description'] ?? null,
      location: json['location'] ?? null,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date']),
      endDate:
          json['end_date'] == null ? null : DateTime.parse(json['end_date']),
      image: json['image'] == null || json['image']['url'] == null
          ? null
          : json['image']['url']);
}