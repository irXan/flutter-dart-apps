import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'config/app_theme.dart';
import 'config/constants.dart';
import 'providers/user_provider.dart';
import 'providers/property_provider.dart';

import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/user/home_screen.dart';
import 'screens/user/search_screen.dart';
import 'screens/user/property_details_screen.dart';
import 'models/navigation_args.dart';
import 'screens/user/booking_screen.dart';
import 'screens/user/profile_screen.dart';
import 'screens/seller/seller_dashboard_screen.dart';
import 'screens/seller/add_property_screen.dart';
import 'screens/seller/manage_properties_screen.dart' as seller_manage;
import 'screens/seller/view_inquiries_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/admin/manage_users_screen.dart';
import 'screens/admin/manage_properties_screen.dart' as admin_manage;
import 'screens/admin/analytics_screen.dart';
import 'screens/admin/transactions_screen.dart';

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	bool firebaseReady = true;
	try {
		await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
	} catch (_) {
		firebaseReady = false;
	}
	runApp(MyApp(isFirebaseReady: firebaseReady));
}

class MyApp extends StatelessWidget {
	final bool isFirebaseReady;
	const MyApp({super.key, required this.isFirebaseReady});

	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				ChangeNotifierProvider(create: (_) => UserProvider(isFirebaseReady: isFirebaseReady)),
				ChangeNotifierProvider(create: (_) => PropertyProvider(isFirebaseReady: isFirebaseReady)),

			],
			child: MaterialApp(
				debugShowCheckedModeBanner: false,
				title: AppConstants.appName,
				theme: AppTheme.lightTheme,
				darkTheme: AppTheme.darkTheme,
				themeMode: ThemeMode.system,
				initialRoute: AppRoutes.splash,
				routes: {
					AppRoutes.splash: (_) => const SplashScreen(),
					AppRoutes.onboarding: (_) => const OnboardingScreen(),
					AppRoutes.login: (_) => const LoginScreen(),
					AppRoutes.signup: (_) => const SignupScreen(),
					AppRoutes.home: (_) => const HomeScreen(),
					AppRoutes.search: (_) => const SearchScreen(),
					AppRoutes.booking: (_) => const BookingScreen(),
					AppRoutes.profile: (_) => const ProfileScreen(),
					AppRoutes.sellerDashboard: (_) => const SellerDashboardScreen(),
					AppRoutes.addProperty: (_) => const AddPropertyScreen(),
					AppRoutes.sellerManageProperties: (_) => const seller_manage.ManagePropertiesScreen(),
					AppRoutes.viewInquiries: (_) => const ViewInquiriesScreen(),
					AppRoutes.adminDashboard: (_) => const AdminDashboardScreen(),
					AppRoutes.adminManageUsers: (_) => const ManageUsersScreen(),
					AppRoutes.adminManageProperties: (_) => const admin_manage.ManagePropertiesScreen(),
					AppRoutes.analytics: (_) => const AnalyticsScreen(),
					AppRoutes.transactions: (_) => const TransactionsScreen(),
				},
				onGenerateRoute: (settings) {
					if (settings.name == AppRoutes.propertyDetails) {
						final args = settings.arguments;
						if (args is PropertyDetailsArgs) {
							return MaterialPageRoute(builder: (_) => PropertyDetailsScreen(args: args));
						}
					}
					return null;
				},
			),
		);
	}
}