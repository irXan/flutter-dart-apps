import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/property_provider.dart';
import '../../widgets/property_card.dart';
import '../../models/navigation_args.dart';

class SearchScreen extends StatefulWidget {
	const SearchScreen({super.key});

	@override
	State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
	String _query = '';

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();
		final arg = ModalRoute.of(context)?.settings.arguments;
		if (arg is String && arg != _query) {
			_query = arg;
			context.read<PropertyProvider>().search(_query);
		}
	}

	@override
	Widget build(BuildContext context) {
		final provider = context.watch<PropertyProvider>();
		return Scaffold(
			appBar: AppBar(title: Text('Search: $_query')),
			body: Padding(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				child: provider.isSearching
					? const Center(child: CircularProgressIndicator())
					: ListView.builder(
						itemCount: provider.searchResults.length,
						itemBuilder: (context, index) {
							final property = provider.searchResults[index];
							return PropertyCard(
								property: property,
								onTap: () => Navigator.of(context).pushNamed(AppRoutes.propertyDetails, arguments: PropertyDetailsArgs(propertyId: property.id)),
							);
						},
					),
			),
		);
	}
}