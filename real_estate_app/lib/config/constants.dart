class AppConstants {
	static const String appName = 'PrimeEstate';
	static const double defaultPadding = 16.0;
	static const double defaultRadius = 12.0;
}

class AppRoutes {
	static const String splash = '/splash';
	static const String onboarding = '/onboarding';
	static const String login = '/login';
	static const String signup = '/signup';
	static const String home = '/home';
	static const String search = '/search';
	static const String propertyDetails = '/property-details';
	static const String booking = '/booking';
	static const String profile = '/profile';
	static const String sellerDashboard = '/seller/dashboard';
	static const String addProperty = '/seller/add-property';
	static const String sellerManageProperties = '/seller/manage-properties';
	static const String viewInquiries = '/seller/view-inquiries';
	static const String adminDashboard = '/admin/dashboard';
	static const String adminManageUsers = '/admin/manage-users';
	static const String adminManageProperties = '/admin/manage-properties';
	static const String analytics = '/admin/analytics';
	static const String transactions = '/admin/transactions';
}

class FirestorePaths {
	static const String users = 'users';
	static const String properties = 'properties';
	static const String bookings = 'bookings';
	static const String inquiries = 'inquiries';
}

class Roles {
	static const String user = 'user';
	static const String seller = 'seller';
	static const String admin = 'admin';
}