import 'package:flutter/material.dart';

class ManagePropertiesScreen extends StatelessWidget {
	const ManagePropertiesScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(appBar: AppBar(title: const Text('All properties')), body: const Center(child: Text('All properties across the platform will appear here.')));
	}
}