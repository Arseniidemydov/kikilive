import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KikiFirebaseUser {
  KikiFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

KikiFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KikiFirebaseUser> kikiFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<KikiFirebaseUser>(
      (user) {
        currentUser = KikiFirebaseUser(user);
        return currentUser!;
      },
    );
