import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
	final String label;
	final VoidCallback? onPressed;
	final bool isPrimary;
	final bool isLoading;
	final IconData? icon;

	const CustomButton({super.key, required this.label, this.onPressed, this.isPrimary = true, this.isLoading = false, this.icon});

	@override
	Widget build(BuildContext context) {
		final ColorScheme colors = Theme.of(context).colorScheme;
		final ButtonStyle style = isPrimary
			? ElevatedButton.styleFrom(backgroundColor: colors.primary, foregroundColor: colors.onPrimary)
			: ElevatedButton.styleFrom(backgroundColor: colors.secondaryContainer, foregroundColor: colors.onSecondaryContainer);
		return SizedBox(
			width: double.infinity,
			height: 48,
			child: ElevatedButton(
				onPressed: isLoading ? null : onPressed,
				style: style,
				child: isLoading
					? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: colors.onPrimary))
				: Row(
					mainAxisAlignment: MainAxisAlignment.center,
					mainAxisSize: MainAxisSize.min,
					children: [
						if (icon != null) ...[
							Icon(icon, size: 18),
							const SizedBox(width: 8),
						],
						Text(label),
					],
				),
			),
		);
	}
}