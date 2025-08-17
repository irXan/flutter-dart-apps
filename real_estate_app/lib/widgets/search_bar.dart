import 'package:flutter/material.dart';

import '../config/constants.dart';

class SearchBarWidget extends StatefulWidget {
	final String? initialQuery;
	const SearchBarWidget({super.key, this.initialQuery});

	@override
	State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
	late final TextEditingController _controller;

	@override
	void initState() {
		super.initState();
		_controller = TextEditingController(text: widget.initialQuery ?? '');
	}

	@override
	void dispose() {
		_controller.dispose();
		super.dispose();
	}

	void _submit(String value) {
		final query = value.trim();
		if (query.isEmpty) return;
		Navigator.of(context).pushNamed(AppRoutes.search, arguments: query);
	}

	@override
	Widget build(BuildContext context) {
		final ColorScheme colors = Theme.of(context).colorScheme;
		return TextField(
			controller: _controller,
			textInputAction: TextInputAction.search,
			onSubmitted: _submit,
			decoration: InputDecoration(
				prefixIcon: Icon(Icons.search, color: colors.primary),
				hintText: 'Search properties, cities, addresses...'
			),
		);
	}
}