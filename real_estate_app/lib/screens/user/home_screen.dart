import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/property_provider.dart';
import '../../widgets/property_card.dart';
import '../../widgets/search_bar.dart';
import '../../models/navigation_args.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final provider = context.watch<PropertyProvider>();
		return Scaffold(
			appBar: AppBar(
				title: const Text('Discover'),
				actions: [
					IconButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.profile), icon: const Icon(Icons.person_outline)),
				],
			),
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(AppConstants.defaultPadding),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: [
							const SearchBarWidget(),
							const SizedBox(height: 16),
							Text('Featured', style: Theme.of(context).textTheme.titleLarge),
							const SizedBox(height: 8),
							Expanded(
								child: ListView.builder(
									itemCount: provider.featured.length,
									itemBuilder: (context, index) {
										final property = provider.featured[index];
										return PropertyCard(
											property: property,
											onTap: () => Navigator.of(context).pushNamed(AppRoutes.propertyDetails, arguments: PropertyDetailsArgs(propertyId: property.id)),
										);
									},
								),
							),
						],
					),
				),
			),
			drawer: const _HomeDrawer(),
		);
	}
}

class _HomeDrawer extends StatelessWidget {
	const _HomeDrawer();
	@override
	Widget build(BuildContext context) {
		return Drawer(
			child: ListView(
				children: [
					const DrawerHeader(child: Text('PrimeEstate')),
					ListTile(leading: const Icon(Icons.dashboard_customize), title: const Text('Seller dashboard'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.sellerDashboard)),
					ListTile(leading: const Icon(Icons.admin_panel_settings), title: const Text('Admin'), onTap: () => Navigator.of(context).pushNamed(AppRoutes.adminDashboard)),
				],
			),
		);
	}
}