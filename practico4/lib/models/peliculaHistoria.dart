class Peliculahistoria {
  final int id;
  final String title;
  final DateTime timestamp;

  Peliculahistoria({required this.id, required this.title, DateTime? timestamp})
      : timestamp = timestamp ?? DateTime.now();

  factory Peliculahistoria.fromJson(Map<String, dynamic> json) {
    return Peliculahistoria(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'timestamp': timestamp.toIso8601String(),
      };

  @override
  String toString() {
    return 'Peliculahistoria{id: $id, title: $title}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
