import 'package:flutter/material.dart';

class ManagePropertiesScreen extends StatelessWidget {
	const ManagePropertiesScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(appBar: AppBar(title: const Text('Manage properties')), body: const Center(child: Text('Your properties will appear here.')));
	}
}