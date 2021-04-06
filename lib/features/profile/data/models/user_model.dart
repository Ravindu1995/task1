import 'package:TODO/features/profile/domain/entities/users.dart';

class UserModel extends User {
  final String uID;
  final String name;
  final String email;
  //final String password;

  UserModel( {this.name, this.uID, this.email}) : super(uID,name, email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      //'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      //password : map['password'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source));
}
