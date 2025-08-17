import 'package:flutter/material.dart';

import '../models/property_model.dart';
import '../services/property_service.dart';

class PropertyProvider extends ChangeNotifier {
	final PropertyService _service;

	List<Property> _featured = const [];
	List<Property> get featured => _featured;
	bool _isSearching = false;
	List<Property> _searchResults = const [];
	List<Property> get searchResults => _searchResults;

	PropertyProvider({required bool isFirebaseReady}) : _service = PropertyService(isFirebaseReady: isFirebaseReady) {
		_service.watchFeatured().listen((items) {
			_featured = items;
			notifyListeners();
		});
	}

	Future<void> search(String query) async {
		_isSearching = true;
		notifyListeners();
		try {
			_searchResults = await _service.search(query: query);
		} finally {
			_isSearching = false;
			notifyListeners();
		}
	}

	bool get isSearching => _isSearching;
}