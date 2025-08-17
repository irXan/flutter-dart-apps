import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/constants.dart';
import '../models/property_model.dart';

class PropertyService {
	final bool isFirebaseReady;
	final FirebaseFirestore _db = FirebaseFirestore.instance;
	PropertyService({required this.isFirebaseReady});

	Stream<List<Property>> watchFeatured() {
		if (!isFirebaseReady) return Stream.value(const []);
		return _db
			.collection(FirestorePaths.properties)
			.where('isFeatured', isEqualTo: true)
			.orderBy('createdAt', descending: true)
			.limit(20)
			.snapshots()
			.map((s) => s.docs.map((d) => Property.fromDoc(d)).toList());
	}

	Future<List<Property>> search({required String query}) async {
		if (!isFirebaseReady) return const [];
		final snap = await _db
			.collection(FirestorePaths.properties)
			.where('keywords', arrayContains: query.toLowerCase())
			.limit(50)
			.get();
		return snap.docs.map((d) => Property.fromDoc(d)).toList();
	}

	Future<String> addProperty(Property property) async {
		if (!isFirebaseReady) return 'local-id';
		final ref = _db.collection(FirestorePaths.properties).doc();
		final toSave = property.copyWith().toMap()..['id'] = ref.id;
		await ref.set(toSave);
		return ref.id;
	}

	Future<void> updateProperty(Property property) async {
		if (!isFirebaseReady) return;
		await _db.collection(FirestorePaths.properties).doc(property.id).update(property.toMap());
	}

	Future<void> deleteProperty(String propertyId) async {
		if (!isFirebaseReady) return;
		await _db.collection(FirestorePaths.properties).doc(propertyId).delete();
	}
}