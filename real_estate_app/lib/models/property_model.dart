import 'package:cloud_firestore/cloud_firestore.dart';

class Property {
	final String id;
	final String title;
	final String description;
	final String location;
	final double price;
	final int bedrooms;
	final int bathrooms;
	final double areaSqft;
	final List<String> imageUrls;
	final String sellerId;
	final DateTime createdAt;
	final bool isFeatured;

	const Property({
		required this.id,
		required this.title,
		required this.description,
		required this.location,
		required this.price,
		required this.bedrooms,
		required this.bathrooms,
		required this.areaSqft,
		required this.imageUrls,
		required this.sellerId,
		required this.createdAt,
		this.isFeatured = false,
	});

	Property copyWith({
		String? title,
		String? description,
		String? location,
		double? price,
		int? bedrooms,
		int? bathrooms,
		double? areaSqft,
		List<String>? imageUrls,
		bool? isFeatured,
	}) {
		return Property(
			id: id,
			title: title ?? this.title,
			description: description ?? this.description,
			location: location ?? this.location,
			price: price ?? this.price,
			bedrooms: bedrooms ?? this.bedrooms,
			bathrooms: bathrooms ?? this.bathrooms,
			areaSqft: areaSqft ?? this.areaSqft,
			imageUrls: imageUrls ?? this.imageUrls,
			sellerId: sellerId,
			createdAt: createdAt,
			isFeatured: isFeatured ?? this.isFeatured,
		);
	}

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'title': title,
			'description': description,
			'location': location,
			'price': price,
			'bedrooms': bedrooms,
			'bathrooms': bathrooms,
			'areaSqft': areaSqft,
			'imageUrls': imageUrls,
			'sellerId': sellerId,
			'createdAt': Timestamp.fromDate(createdAt),
			'isFeatured': isFeatured,
		};
	}

	factory Property.fromMap(Map<String, dynamic> map) {
		return Property(
			id: map['id'] as String,
			title: map['title'] as String,
			description: (map['description'] as String?) ?? '',
			location: (map['location'] as String?) ?? '',
			price: (map['price'] is int) ? (map['price'] as int).toDouble() : (map['price'] as num).toDouble(),
			bedrooms: (map['bedrooms'] as num?)?.toInt() ?? 0,
			bathrooms: (map['bathrooms'] as num?)?.toInt() ?? 0,
			areaSqft: (map['areaSqft'] is int) ? (map['areaSqft'] as int).toDouble() : (map['areaSqft'] as num?)?.toDouble() ?? 0,
			imageUrls: (map['imageUrls'] as List<dynamic>? ?? []).map((e) => e.toString()).toList(),
			sellerId: (map['sellerId'] as String?) ?? '',
			createdAt: (map['createdAt'] is Timestamp)
				? (map['createdAt'] as Timestamp).toDate()
				: DateTime.tryParse(map['createdAt']?.toString() ?? '') ?? DateTime.now(),
			isFeatured: map['isFeatured'] == true,
		);
	}

	factory Property.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
		final data = doc.data() ?? {};
		return Property.fromMap({...data, 'id': doc.id});
	}
}