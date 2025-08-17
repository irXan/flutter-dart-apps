import 'package:flutter/material.dart';

import '../models/property_model.dart';
import '../utils/formatters.dart';

class PropertyCard extends StatelessWidget {
	final Property property;
	final VoidCallback? onTap;
	const PropertyCard({super.key, required this.property, this.onTap});

	@override
	Widget build(BuildContext context) {
		final ColorScheme colors = Theme.of(context).colorScheme;
		return InkWell(
			onTap: onTap,
			child: Container(
				margin: const EdgeInsets.symmetric(vertical: 8),
				decoration: BoxDecoration(
					color: colors.surface,
					borderRadius: BorderRadius.circular(16),
					boxShadow: [
						BoxShadow(color: colors.shadow.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4)),
					],
				),
				child: Row(
					children: [
						ClipRRect(
							borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
							child: SizedBox(
								width: 120,
								height: 100,
								child: property.imageUrls.isNotEmpty
									? Image.network(property.imageUrls.first, fit: BoxFit.cover)
									: Container(color: colors.surfaceVariant, child: const Icon(Icons.photo, size: 40)),
							),
						),
						Expanded(
							child: Padding(
								padding: const EdgeInsets.all(12),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(property.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium),
										const SizedBox(height: 4),
										Text(property.location, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
										const SizedBox(height: 8),
										Row(
											children: [
												Icon(Icons.bed, size: 16, color: colors.primary),
												const SizedBox(width: 4),
												Text('${property.bedrooms}'),
												const SizedBox(width: 12),
												Icon(Icons.bathtub, size: 16, color: colors.primary),
												const SizedBox(width: 4),
												Text('${property.bathrooms}'),
											],
										),
										const SizedBox(height: 8),
										Text(Formatters.currency(property.price), style: Theme.of(context).textTheme.titleMedium?.copyWith(color: colors.primary)),
									],
								),
							),
						),
					],
				),
			),
		);
	}
}