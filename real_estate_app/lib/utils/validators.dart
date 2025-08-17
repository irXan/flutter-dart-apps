class Validators {
	static String? email(String? value) {
		if (value == null || value.trim().isEmpty) return 'Email is required';
		final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
		if (!regex.hasMatch(value.trim())) return 'Enter a valid email';
		return null;
	}

	static String? password(String? value) {
		if (value == null || value.isEmpty) return 'Password is required';
		if (value.length < 6) return 'Minimum 6 characters';
		return null;
	}

	static String? nonEmpty(String? value, {String field = 'Field'}) {
		if (value == null || value.trim().isEmpty) return '$field is required';
		return null;
	}
}