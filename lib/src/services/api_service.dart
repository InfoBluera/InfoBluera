// class ApiService {
//   // Singleton pattern
//   static final ApiService _instance = ApiService._internal();
//   factory ApiService() => _instance;
//   ApiService._internal();

//   final Map<String, dynamic> _mockDatabase = {
//     'services': [
//       {'id': 1, 'name': 'Web Development'},
//       {'id': 2, 'name': 'Mobile Apps'},
//     ],
//   };

//   /// Simulates a GET request to the Node.js backend
//   Future<dynamic> get(String endpoint) async {
//     // Simulate network delay
//     await Future.delayed(const Duration(milliseconds: 500));

//     if (endpoint == '/services') {
//       return _mockDatabase['services'];
//     }

//     // In production, use http.get or dio.get
//     return null;
//   }

//   /// Simulates posting data to the backend (e.g. Contact Form)
//   Future<bool> post(String endpoint, Map<String, dynamic> data) async {
//     await Future.delayed(const Duration(milliseconds: 800));
//     print('Posting to $endpoint: $data');
//     return true;
//   }
// }
