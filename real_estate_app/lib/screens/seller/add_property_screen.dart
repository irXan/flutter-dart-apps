import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';

class AddPropertyScreen extends StatefulWidget {
	const AddPropertyScreen({super.key});

	@override
	State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
	final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	final TextEditingController _title = TextEditingController();
	final TextEditingController _location = TextEditingController();
	final TextEditingController _price = TextEditingController();

	@override
	void dispose() {
		_title.dispose();
		_location.dispose();
		_price.dispose();
		super.dispose();
	}

	void _submit() {
		if (!_formKey.currentState!.validate()) return;
		ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Property submitted (placeholder)')));
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Add property')),
			body: SingleChildScrollView(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				child: Form(
					key: _formKey,
					child: Column(
						children: [
							TextFormField(controller: _title, validator: (v) => Validators.nonEmpty(v, field: 'Title'), decoration: const InputDecoration(labelText: 'Title')),
							const SizedBox(height: 12),
							TextFormField(controller: _location, validator: (v) => Validators.nonEmpty(v, field: 'Location'), decoration: const InputDecoration(labelText: 'Location')),
							const SizedBox(height: 12),
							TextFormField(controller: _price, keyboardType: TextInputType.number, validator: (v) => Validators.nonEmpty(v, field: 'Price'), decoration: const InputDecoration(labelText: 'Price')),
							const SizedBox(height: 20),
							CustomButton(label: 'Submit', onPressed: _submit),
						],
					),
				),
			),
		);
	}
}