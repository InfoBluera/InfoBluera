// class FirebaseService {
//   // Singleton
//   static final FirebaseService _instance = FirebaseService._internal();
//   factory FirebaseService() => _instance;
//   FirebaseService._internal();

//   /// Initialize Firebase App (Web/Mobile)
//   Future<void> initialize() async {
//     // await Firebase.initializeApp();
//     print('Firebase Initialized (Mock)');
//   }

//   /// Mock Auth Sign In
//   Future<void> signInAnonymously() async {
//     await Future.delayed(const Duration(milliseconds: 500));
//     print('User Signed In Anonymously');
//   }

//   /// Log custom analytics event
//   Future<void> logEvent(String name, Map<String, dynamic> parameters) async {
//     print('Analytics Event: $name, $parameters');
//   }
// }
