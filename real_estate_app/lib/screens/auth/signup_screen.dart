import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/user_provider.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
	const SignupScreen({super.key});

	@override
	State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	final TextEditingController _name = TextEditingController();
	final TextEditingController _email = TextEditingController();
	final TextEditingController _password = TextEditingController();

	@override
	void dispose() {
		_name.dispose();
		_email.dispose();
		_password.dispose();
		super.dispose();
	}

	Future<void> _submit() async {
		if (!_formKey.currentState!.validate()) return;
		final userProvider = context.read<UserProvider>();
		await userProvider.signUp(_email.text.trim(), _password.text, displayName: _name.text.trim());
		if (userProvider.isAuthenticated) {
			if (mounted) Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
		}
	}

	@override
	Widget build(BuildContext context) {
		final isLoading = context.watch<UserProvider>().isLoading;
		return Scaffold(
			appBar: AppBar(title: const Text('Create account')),
			body: SafeArea(
				child: SingleChildScrollView(
					padding: const EdgeInsets.all(AppConstants.defaultPadding),
					child: Form(
						key: _formKey,
						child: Column(
							children: [
								TextFormField(controller: _name, validator: (v) => Validators.nonEmpty(v, field: 'Name'), decoration: const InputDecoration(labelText: 'Full name')),
								const SizedBox(height: 12),
								TextFormField(controller: _email, keyboardType: TextInputType.emailAddress, validator: Validators.email, decoration: const InputDecoration(labelText: 'Email')),
								const SizedBox(height: 12),
								TextFormField(controller: _password, obscureText: true, validator: Validators.password, decoration: const InputDecoration(labelText: 'Password')),
								const SizedBox(height: 20),
								CustomButton(label: 'Create account', onPressed: _submit, isLoading: isLoading),
								const SizedBox(height: 12),
								TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.login), child: const Text('I already have an account')),
							],
						),
					),
				),
			),
		);
	}
}