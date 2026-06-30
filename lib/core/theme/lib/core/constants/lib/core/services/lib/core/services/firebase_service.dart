import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;
  late FirebaseStorage _storage;

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal() {
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    _storage = FirebaseStorage.instance;
  }

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;
  FirebaseStorage get storage => _storage;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> saveUserData(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(uid).set(data);
  }

  Future<DocumentSnapshot> getUserData(String uid) async {
    return await _firestore.collection('users').doc(uid).get();
  }
}
