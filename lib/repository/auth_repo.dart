import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_ui/modals/user_model.dart';

class AuthRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> create({required String email, required String password}) async {
    try {
      final DocumentReference reference = await _firestore
          .collection('users')
          .add({'email': email, 'password': password});
      final DocumentSnapshot documentSnapshot = await reference.get();
      if (documentSnapshot.exists) {
        return true;
      } else {
        // Handle the case when the document does not exist after adding
        return false;
      }
    } on FirebaseException catch (e) {
      print("failed with error '${e.code}': ${e.message}");
      return false;
    } catch (e) {
      print('implement error state');
      return false;
    }
  }

  Future<UserModel?> get({required String email}) async {
    try {
      final QuerySnapshot result = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (result.docs.isNotEmpty) {
        final userData = result.docs.first.data();

        final user = UserModel.fromJson(userData as Map<String, dynamic>);
        return user;
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      print("failed with error '${e.code}': ${e.message}");
      return null;
    } catch (e) {
      print('implement error state');
      return null;
    }
  }
}
