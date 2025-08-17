import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../widgets/custom_button.dart';

class BookingScreen extends StatefulWidget {
	const BookingScreen({super.key});

	@override
	State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
	DateTime? _selectedDate;
	String get _dateLabel => _selectedDate == null ? 'Select date' : '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}';

	Future<void> _pickDate() async {
		final now = DateTime.now();
		final picked = await showDatePicker(context: context, firstDate: now, lastDate: DateTime(now.year + 1), initialDate: now);
		if (picked != null) setState(() => _selectedDate = picked);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Book a viewing')),
			body: Padding(
				padding: const EdgeInsets.all(AppConstants.defaultPadding),
				child: Column(
					children: [
						ListTile(leading: const Icon(Icons.event), title: Text(_dateLabel), trailing: const Icon(Icons.calendar_today), onTap: _pickDate),
						const Spacer(),
						CustomButton(label: 'Confirm booking', onPressed: _selectedDate == null ? null : () {}),
					],
				),
			),
		);
	}
}