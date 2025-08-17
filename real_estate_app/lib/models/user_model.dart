import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/constants.dart';

class AppUser {
	final String id;
	final String email;
	final String? displayName;
	final String role; // Roles.user/seller/admin
	final String? photoUrl;
	final DateTime createdAt;

	const AppUser({
		required this.id,
		required this.email,
		required this.role,
		this.displayName,
		this.photoUrl,
		required this.createdAt,
	});

	bool get isAdmin => role == Roles.admin;
	bool get isSeller => role == Roles.seller;
	bool get isUser => role == Roles.user;

	AppUser copyWith({String? email, String? displayName, String? role, String? photoUrl}) {
		return AppUser(
			id: id,
			email: email ?? this.email,
			role: role ?? this.role,
			displayName: displayName ?? this.displayName,
			photoUrl: photoUrl ?? this.photoUrl,
			createdAt: createdAt,
		);
	}

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'email': email,
			'displayName': displayName,
			'role': role,
			'photoUrl': photoUrl,
			'createdAt': Timestamp.fromDate(createdAt),
		};
	}

	factory AppUser.fromMap(Map<String, dynamic> map) {
		return AppUser(
			id: map['id'] as String,
			email: map['email'] as String,
			role: (map['role'] as String?) ?? Roles.user,
			displayName: map['displayName'] as String?,
			photoUrl: map['photoUrl'] as String?,
			createdAt: (map['createdAt'] is Timestamp)
				? (map['createdAt'] as Timestamp).toDate()
				: DateTime.tryParse(map['createdAt']?.toString() ?? '') ?? DateTime.now(),
		);
	}

	factory AppUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
		final data = doc.data() ?? {};
		return AppUser.fromMap({...data, 'id': doc.id});
	}
}