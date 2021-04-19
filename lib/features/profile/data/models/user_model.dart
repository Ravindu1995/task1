import 'package:TODO/features/profile/domain/entities/users.dart';

class UserModel extends UserEntity {
  final String uid;
  final String name;
  final String email;
  //final String password;

  UserModel( {this.name, this.uid, this.email}) : super(email : email , name: name);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      
    );
  }

  // String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source));
}
