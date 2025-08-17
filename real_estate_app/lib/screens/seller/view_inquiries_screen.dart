import 'package:flutter/material.dart';

class ViewInquiriesScreen extends StatelessWidget {
	const ViewInquiriesScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(appBar: AppBar(title: const Text('Inquiries')), body: const Center(child: Text('Inquiries from buyers will appear here.')));
	}
}