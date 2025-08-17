import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/constants.dart';
import '../providers/user_provider.dart';

class SplashScreen extends StatefulWidget {
	const SplashScreen({super.key});

	@override
	State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
	Timer? _timer;

	@override
	void initState() {
		super.initState();
		_timer = Timer(const Duration(milliseconds: 1200), _goNext);
	}

	void _goNext() {
		final userProvider = context.read<UserProvider>();
		if (userProvider.isAuthenticated) {
			Navigator.of(context).pushReplacementNamed(AppRoutes.home);
		} else {
			Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
		}
	}

	@override
	void dispose() {
		_timer?.cancel();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		final ColorScheme colors = Theme.of(context).colorScheme;
		return Scaffold(
			backgroundColor: colors.primary,
			body: Center(
				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Icon(Icons.house_rounded, size: 72, color: colors.onPrimary),
						const SizedBox(height: 12),
						Text(AppConstants.appName, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: colors.onPrimary)),
					],
				),
			),
		);
	}
}