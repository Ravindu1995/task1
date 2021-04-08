import 'package:TODO/features/profile/domain/entities/users.dart';

class UserModel extends User {
  final String uID;
  final String name;
  final String email;
  //final String password;

  UserModel( {this.name, this.uID, this.email}) : super(name, email);

  Map<String, dynamic> toMap() {
    return {
      'id': uID,
      'name': name,
      'email': email,
      
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uID: map['id'],
      name: map['name'],
      email: map['email'],
      
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source));
}
