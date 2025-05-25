class Client {
  final String id;
  final String name;
  final String code;
  final bool isAvailable;

  Client({
    required this.id,
    required this.name,
    required this.code,
    required this.isAvailable,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      isAvailable: json['isAvailable'] as bool,
    );
  }
} 