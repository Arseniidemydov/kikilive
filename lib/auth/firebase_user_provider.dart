import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BryanFirebaseUser {
  BryanFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BryanFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BryanFirebaseUser> bryanFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BryanFirebaseUser>(
      (user) {
        currentUser = BryanFirebaseUser(user);
        return currentUser!;
      },
    );
