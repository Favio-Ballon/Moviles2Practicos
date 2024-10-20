class Cast {
  int id;
  String name;


  Cast({
      required this.id,
      required this.name,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
      return Cast(
          id: json['id'],
          name: json['name'],
      );
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      return data;
  }

  Map<String, dynamic> toMap() {
      return {
          'id': id,
          'name': name,
      };
  }
  


}