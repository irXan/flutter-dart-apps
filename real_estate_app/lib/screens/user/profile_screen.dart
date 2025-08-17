import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
	const ProfileScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final user = context.watch<UserProvider>().currentUser;
		return Scaffold(
			appBar: AppBar(title: const Text('Profile')),
			body: Padding(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						if (user != null) ...[
							CircleAvatar(radius: 32, child: Text(user.displayName?.substring(0, 1).toUpperCase() ?? 'U')),
							const SizedBox(height: 12),
							Text(user.displayName ?? 'User', style: Theme.of(context).textTheme.titleMedium),
							Text(user.email, style: Theme.of(context).textTheme.bodyMedium),
							const SizedBox(height: 12),
							Chip(label: Text(user.role.toUpperCase())),
						],
						const Spacer(),
						ElevatedButton.icon(onPressed: () async { await context.read<UserProvider>().signOut(); if (context.mounted) Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.onboarding, (_) => false); }, icon: const Icon(Icons.logout), label: const Text('Sign out')),
					],
				),
			),
		);
	}
}