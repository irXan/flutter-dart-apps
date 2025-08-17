import 'package:flutter/material.dart';

import '../../config/constants.dart';

class AdminDashboardScreen extends StatelessWidget {
	const AdminDashboardScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Admin dashboard')),
			body: ListView(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				children: [
					ListTile(leading: const Icon(Icons.group_outlined), title: const Text('Manage users'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.adminManageUsers)),
					ListTile(leading: const Icon(Icons.home_work_outlined), title: const Text('Manage properties'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.adminManageProperties)),
					ListTile(leading: const Icon(Icons.query_stats_outlined), title: const Text('Analytics'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.analytics)),
					ListTile(leading: const Icon(Icons.receipt_long_outlined), title: const Text('Transactions'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.transactions)),
				],
			),
		);
	}
}