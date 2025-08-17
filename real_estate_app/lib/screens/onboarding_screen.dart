import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
	const OnboardingScreen({super.key});

	@override
	Widget build(BuildContext context) {
		final ColorScheme colors = Theme.of(context).colorScheme;
		return Scaffold(
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(AppConstants.defaultPadding),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,
						children: [
							Expanded(
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										Icon(Icons.apartment_rounded, size: 100, color: colors.primary),
										const SizedBox(height: 24),
										Text('Find your next home', style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
										const SizedBox(height: 12),
										Text('Browse premium listings, book viewings, and manage properties with ease.', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
									],
								),
							),
							CustomButton(label: 'Create account', onPressed: () => Navigator.of(context).pushNamed(AppRoutes.signup)),
							const SizedBox(height: 12),
							CustomButton(label: 'I already have an account', isPrimary: false, onPressed: () => Navigator.of(context).pushNamed(AppRoutes.login)),
						],
					),
				),
			),
		);
	}
}