class User {
  final String id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String type;
  final bool active;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'] as String,
      username: json['Username'] as String,
      name: json['Name'] as String,
      email: json['Email'] as String,
      phone: json['Phone'] as String,
      type: json['Type'] as String,
      active: json['Active'] as bool,
      createdAt: DateTime.parse(json['CreatedAt'] as String),
      updatedAt: DateTime.parse(json['UpdatedAt'] as String),
    );
  }
} 