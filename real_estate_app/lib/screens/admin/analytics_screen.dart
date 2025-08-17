import 'package:flutter/material.dart';

import '../../config/constants.dart';

class AnalyticsScreen extends StatelessWidget {
	const AnalyticsScreen({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Analytics')),
			body: GridView.count(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				crossAxisCount: 2,
				mainAxisSpacing: 12,
				crossAxisSpacing: 12,
				children: const [
					_StatCard(title: 'Active users', value: '1,240'),
					_StatCard(title: 'Listings', value: '532'),
					_StatCard(title: 'Bookings', value: '218'),
					_StatCard(title: 'Revenue', value: '\$2.3M'),
				],
			),
		);
	}
}

class _StatCard extends StatelessWidget {
	final String title;
	final String value;
	const _StatCard({required this.title, required this.value});

	@override
	Widget build(BuildContext context) {
		return Container(
			decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(16)),
			padding: const EdgeInsets.all(16),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Text(title, style: Theme.of(context).textTheme.bodyMedium),
					const Spacer(),
					Text(value, style: Theme.of(context).textTheme.headlineSmall),
				],
			),
		);
	}
}