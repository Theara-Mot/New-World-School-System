class Users{
  String? id;
  late final String name;
  late final String userName;
  late final String password;

  Users({
    this.id = '',
    required this.name,
    required this.userName,
    required this.password});

  Map<String,dynamic> toJson() => {
    'id': id,
    'name':name,
    'userName':userName,
    'password':password
  };

  static Users fromJson(Map<String,dynamic> json) =>Users(
      id: json['id'],
      name: json['name'],
      userName: json['userName'],
      password: json['password']);
}


