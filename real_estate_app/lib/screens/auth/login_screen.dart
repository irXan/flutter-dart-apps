import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/user_provider.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
	const LoginScreen({super.key});

	@override
	State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	final TextEditingController _email = TextEditingController();
	final TextEditingController _password = TextEditingController();

	@override
	void dispose() {
		_email.dispose();
		_password.dispose();
		super.dispose();
	}

	Future<void> _submit() async {
		if (!_formKey.currentState!.validate()) return;
		final userProvider = context.read<UserProvider>();
		await userProvider.signIn(_email.text.trim(), _password.text);
		if (userProvider.isAuthenticated) {
			if (mounted) Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
		}
	}

	@override
	Widget build(BuildContext context) {
		final isLoading = context.watch<UserProvider>().isLoading;
		return Scaffold(
			appBar: AppBar(title: const Text('Sign in')),
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.all(AppConstants.defaultPadding),
					child: Form(
						key: _formKey,
						child: Column(
							children: [
								TextFormField(
									controller: _email,
									keyboardType: TextInputType.emailAddress,
									validator: Validators.email,
									decoration: const InputDecoration(labelText: 'Email'),
								),
								const SizedBox(height: 12),
								TextFormField(
									controller: _password,
									obscureText: true,
									validator: Validators.password,
									decoration: const InputDecoration(labelText: 'Password'),
								),
								const SizedBox(height: 20),
								CustomButton(label: 'Sign in', onPressed: _submit, isLoading: isLoading),
								const SizedBox(height: 12),
								TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.signup), child: const Text('Create account')),
							],
						),
					),
				),
			),
		);
	}
}