import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../utils/formatters.dart';
import '../../models/navigation_args.dart';
import '../../config/constants.dart';

class PropertyDetailsScreen extends StatelessWidget {
	final PropertyDetailsArgs args;
	const PropertyDetailsScreen({super.key, required this.args});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Property details')),
			body: ListView(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				children: [
					Container(
						height: 200,
						decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(16)),
						alignment: Alignment.center,
						child: const Icon(Icons.photo, size: 64),
					),
					const SizedBox(height: 16),
					Text('Property #${args.propertyId}', style: Theme.of(context).textTheme.titleLarge),
					const SizedBox(height: 8),
					Text('Beautiful apartment in the city center with modern amenities and spacious rooms.', style: Theme.of(context).textTheme.bodyMedium),
					const SizedBox(height: 16),
					Row(children: [
						const Icon(Icons.attach_money, size: 18),
						const SizedBox(width: 4),
						Text(Formatters.currency(450000)),
					]),
					const SizedBox(height: 24),
					CustomButton(label: 'Book a viewing', onPressed: () => Navigator.of(context).pushNamed(AppRoutes.booking, arguments: args.propertyId)),
				],
			),
		);
	}
}