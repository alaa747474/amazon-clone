
class UserModel {
  final String? name;
  final String email;
  final String password;

  UserModel(this.name, this.email, this.password);
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'],
      map['email'] ?? '',
      map['password'] ?? '',
    );
  }


  
}
