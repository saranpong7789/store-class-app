import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/firebase_service.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loadUserData(String uid) async {
    try {
      _isLoading = true;
      notifyListeners();

      final doc = await _firebaseService.getUserData(uid);
      if (doc.exists) {
        _user = UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserData(UserModel user) async {
    try {
      await _firebaseService.saveUserData(user.uid, user.toMap());
      _user = user;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
