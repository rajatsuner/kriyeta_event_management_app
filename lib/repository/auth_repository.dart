import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kriyeta_event_manage/core/constants/firebase_constants.dart';
import 'package:kriyeta_event_manage/core/failure.dart';
import 'package:kriyeta_event_manage/core/type_defs.dart';

import 'package:kriyeta_event_manage/models/user_model.dart';

import '../core/providers/firebase_providers.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle(bool isFromLogin) async {
    try {
      UserCredential userCredential;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      if (isFromLogin) {
        userCredential = await _auth.signInWithCredential(credential);
      } else {
        userCredential =
            await _auth.currentUser!.linkWithCredential(credential);
      }

      UserModel userModel;

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? 'No Name',
            profilePic:
                userCredential.user!.photoURL ?? "Constants.avatarDefault",
            uid: userCredential.user!.uid,
            createdEvents: []);
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map((event) {
      print(event.data() as Map<String, dynamic>);
      print((((event.data() as Map<String, dynamic>)["createdEvents"]
                  as List<dynamic>)
              .map((e) => e as String)
              .toList())
          .runtimeType);
      return UserModel.fromMap(event.data() as Map<String, dynamic>);
    });
  }

  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  FutureEither<UserModel> userAlreadySignedIn() async {
    if (await _googleSignIn.isSignedIn()) {
      UserModel userModel = await getUserData(_auth.currentUser!.uid).first;
      print(userModel.name);
      print(userModel.uid);

      return right(userModel);
    } else {
      return left(Failure("not-signed-in"));
    }
  }
}
