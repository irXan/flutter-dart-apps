import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
	static const Color _seedColor = Color(0xFF2D6A4F);

	static ThemeData get lightTheme {
		final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.light);
		final TextTheme baseText = GoogleFonts.poppinsTextTheme();
		final TextTheme headlines = GoogleFonts.montserratTextTheme();

		return ThemeData(
			useMaterial3: true,
			colorScheme: colorScheme,
			textTheme: baseText.copyWith(
				titleLarge: headlines.titleLarge,
				titleMedium: headlines.titleMedium,
				titleSmall: headlines.titleSmall,
				headlineLarge: headlines.headlineLarge,
				headlineMedium: headlines.headlineMedium,
				headlineSmall: headlines.headlineSmall,
			),
			appBarTheme: AppBarTheme(
				elevation: 0,
				backgroundColor: colorScheme.background,
				foregroundColor: colorScheme.onBackground,
				titleTextStyle: headlines.titleLarge?.copyWith(color: colorScheme.onBackground),
			),
			elevatedButtonTheme: ElevatedButtonThemeData(
				style: ElevatedButton.styleFrom(
					backgroundColor: colorScheme.primary,
					foregroundColor: colorScheme.onPrimary,
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
					padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
				),
			),
			inputDecorationTheme: InputDecorationTheme(
				filled: true,
				fillColor: colorScheme.surfaceVariant,
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
				contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
			),
		);
	}

	static ThemeData get darkTheme {
		final ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: _seedColor, brightness: Brightness.dark);
		final TextTheme baseText = GoogleFonts.poppinsTextTheme(ThemeData(brightness: Brightness.dark).textTheme);
		final TextTheme headlines = GoogleFonts.montserratTextTheme(ThemeData(brightness: Brightness.dark).textTheme);

		return ThemeData(
			useMaterial3: true,
			colorScheme: colorScheme,
			textTheme: baseText.copyWith(
				titleLarge: headlines.titleLarge,
				titleMedium: headlines.titleMedium,
				titleSmall: headlines.titleSmall,
				headlineLarge: headlines.headlineLarge,
				headlineMedium: headlines.headlineMedium,
				headlineSmall: headlines.headlineSmall,
			),
			appBarTheme: AppBarTheme(
				elevation: 0,
				backgroundColor: colorScheme.background,
				foregroundColor: colorScheme.onBackground,
				titleTextStyle: headlines.titleLarge?.copyWith(color: colorScheme.onBackground),
			),
			elevatedButtonTheme: ElevatedButtonThemeData(
				style: ElevatedButton.styleFrom(
					backgroundColor: colorScheme.primary,
					foregroundColor: colorScheme.onPrimary,
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
					padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
				),
			),
			inputDecorationTheme: InputDecorationTheme(
				filled: true,
				fillColor: colorScheme.surfaceVariant,
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
				contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
			),
		);
	}
}