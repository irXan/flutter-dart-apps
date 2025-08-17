import 'package:intl/intl.dart';

class Formatters {
	static final NumberFormat _currency = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
	static final NumberFormat _decimal = NumberFormat.decimalPattern();

	static String currency(num value) => _currency.format(value);
	static String decimal(num value) => _decimal.format(value);
}