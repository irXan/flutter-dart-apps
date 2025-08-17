import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/constants.dart';
import '../models/booking_model.dart';

class BookingService {
	final bool isFirebaseReady;
	final FirebaseFirestore _db = FirebaseFirestore.instance;
	BookingService({required this.isFirebaseReady});

	Stream<List<Booking>> watchUserBookings(String userId) {
		if (!isFirebaseReady) return Stream.value(const []);
		return _db
			.collection(FirestorePaths.bookings)
			.where('userId', isEqualTo: userId)
			.orderBy('createdAt', descending: true)
			.snapshots()
			.map((s) => s.docs.map((d) => Booking.fromDoc(d)).toList());
	}

	Future<String> createBooking(Booking booking) async {
		if (!isFirebaseReady) return 'local-booking';
		final ref = _db.collection(FirestorePaths.bookings).doc();
		await ref.set(booking.toMap());
		return ref.id;
	}

	Future<void> updateStatus(String bookingId, String status) async {
		if (!isFirebaseReady) return;
		await _db.collection(FirestorePaths.bookings).doc(bookingId).update({'status': status});
	}
}