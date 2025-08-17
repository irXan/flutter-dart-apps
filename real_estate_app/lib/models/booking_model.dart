import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
	final String id;
	final String userId;
	final String propertyId;
	final DateTime bookingDate;
	final DateTime createdAt;
	final String status; // pending, confirmed, cancelled

	const Booking({
		required this.id,
		required this.userId,
		required this.propertyId,
		required this.bookingDate,
		required this.createdAt,
		required this.status,
	});

	Booking copyWith({String? status}) => Booking(
		id: id,
		userId: userId,
		propertyId: propertyId,
		bookingDate: bookingDate,
		createdAt: createdAt,
		status: status ?? this.status,
	);

	Map<String, dynamic> toMap() => {
		'id': id,
		'userId': userId,
		'propertyId': propertyId,
		'bookingDate': Timestamp.fromDate(bookingDate),
		'createdAt': Timestamp.fromDate(createdAt),
		'status': status,
	};

	factory Booking.fromMap(Map<String, dynamic> map) => Booking(
		id: map['id'] as String,
		userId: map['userId'] as String,
		propertyId: map['propertyId'] as String,
		bookingDate: (map['bookingDate'] is Timestamp)
			? (map['bookingDate'] as Timestamp).toDate()
			: DateTime.tryParse(map['bookingDate']?.toString() ?? '') ?? DateTime.now(),
		createdAt: (map['createdAt'] is Timestamp)
			? (map['createdAt'] as Timestamp).toDate()
			: DateTime.tryParse(map['createdAt']?.toString() ?? '') ?? DateTime.now(),
		status: (map['status'] as String?) ?? 'pending',
	);

	factory Booking.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
		final data = doc.data() ?? {};
		return Booking.fromMap({...data, 'id': doc.id});
	}
}