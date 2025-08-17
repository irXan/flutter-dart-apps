import 'package:flutter/material.dart';

import '../../config/constants.dart';

class SellerDashboardScreen extends StatelessWidget {
	const SellerDashboardScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Seller dashboard')),
			body: ListView(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				children: [
					ListTile(leading: const Icon(Icons.add_home_work_rounded), title: const Text('Add property'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.addProperty)),
					ListTile(leading: const Icon(Icons.home_work_outlined), title: const Text('Manage properties'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.sellerManageProperties)),
					ListTile(leading: const Icon(Icons.mark_email_unread_outlined), title: const Text('View inquiries'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.viewInquiries)),
				],
			),
		);
	}
}