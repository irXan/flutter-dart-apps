import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';

class UserProvider extends ChangeNotifier {
	final bool isFirebaseReady;
	late final AuthService _authService;
	AppUser? _currentUser;
	bool _isLoading = false;

	UserProvider({required this.isFirebaseReady}) {
		_authService = AuthService(isFirebaseReady: isFirebaseReady);
		_authService.authStateChanges().listen((user) {
			_currentUser = user;
			notifyListeners();
		});
	}

	AppUser? get currentUser => _currentUser;
	bool get isLoading => _isLoading;
	bool get isAuthenticated => _currentUser != null;

	Future<void> signIn(String email, String password) async {
		_isLoading = true;
		notifyListeners();
		try {
			_currentUser = await _authService.signIn(email: email, password: password);
		} finally {
			_isLoading = false;
			notifyListeners();
		}
	}

	Future<void> signUp(String email, String password, {String? displayName}) async {
		_isLoading = true;
		notifyListeners();
		try {
			_currentUser = await _authService.signUp(email: email, password: password, displayName: displayName);
		} finally {
			_isLoading = false;
			notifyListeners();
		}
	}

	Future<void> signOut() async {
		await _authService.signOut();
	}
}