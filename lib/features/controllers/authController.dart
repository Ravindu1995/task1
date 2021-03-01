import 'package:TODO/features/controllers/userController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:TODO/features/controllers/userController.dart';
import 'package:TODO/features/domain/database.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>();

  FirebaseUser get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
  }

  void createUser(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
     
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
       await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}