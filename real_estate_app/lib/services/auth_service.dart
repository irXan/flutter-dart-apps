import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/constants.dart';
import '../models/user_model.dart';

class AuthService {
	final bool isFirebaseReady;
	final fb.FirebaseAuth _auth;
	final FirebaseFirestore _db;

	AuthService({required this.isFirebaseReady})
		: _auth = fb.FirebaseAuth.instance,
			_db = FirebaseFirestore.instance;

	Stream<AppUser?> authStateChanges() {
		if (!isFirebaseReady) return Stream.value(null);
		return _auth.authStateChanges().asyncMap((fb.User? user) async {
			if (user == null) return null;
			final doc = await _db.collection(FirestorePaths.users).doc(user.uid).get();
			if (doc.exists) {
				return AppUser.fromDoc(doc);
			} else {
				final newUser = AppUser(id: user.uid, email: user.email ?? '', role: Roles.user, createdAt: DateTime.now());
				await _db.collection(FirestorePaths.users).doc(user.uid).set(newUser.toMap());
				return newUser;
			}
		});
	}

	Future<AppUser> signUp({required String email, required String password, String? displayName}) async {
		if (!isFirebaseReady) {
			return AppUser(id: 'local', email: email, role: Roles.user, displayName: displayName, createdAt: DateTime.now());
		}
		final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
		if (displayName != null && displayName.isNotEmpty) await cred.user?.updateDisplayName(displayName);
		final user = cred.user!;
		final appUser = AppUser(id: user.uid, email: user.email ?? email, role: Roles.user, displayName: displayName, createdAt: DateTime.now());
		await _db.collection(FirestorePaths.users).doc(user.uid).set(appUser.toMap());
		return appUser;
	}

	Future<AppUser> signIn({required String email, required String password}) async {
		if (!isFirebaseReady) {
			return AppUser(id: 'local', email: email, role: Roles.user, createdAt: DateTime.now());
		}
		final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
		final doc = await _db.collection(FirestorePaths.users).doc(cred.user!.uid).get();
		return AppUser.fromDoc(doc);
	}

	Future<void> signOut() async {
		if (!isFirebaseReady) return;
		await _auth.signOut();
	}
}