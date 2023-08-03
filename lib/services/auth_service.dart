import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (error) {
      print("Sign up error: $error");
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (error) {
      print("Sign in error: $error");
      return null;
    }
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print('Google User: ${googleUser?.email}');
      if (googleUser == null) {
        print('Google Sign-In cancelled by the user.');
        return null; // Or handle the cancellation scenario as needed.
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print('Google User: ${googleAuth.idToken}');

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      // Handle any errors that might occur during the sign-in process
      print('Error signing in with Google: $e');
      return null; // Or handle the error scenario as needed.
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("Sign-out successful!");
    } catch (error) {
      print("Sign out error: $error");
    }
  }
}
