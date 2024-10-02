class Source {
  String? id;
  String? name;

  Source({
    String? id,
    required String name,
  })  : id = id ?? 'default_id',
        name = name ?? 'default_name';

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
