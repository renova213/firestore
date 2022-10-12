import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_clean_architecture/injector.dart';
import 'package:firestore_clean_architecture/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/contact_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBFR9sg8fpl9GtQKEq6uEtzJ8lIT3-yLYc",
          authDomain: "cloudfirestore-54584.firebaseapp.com",
          projectId: "cloudfirestore-54584",
          storageBucket: "cloudfirestore-54584.appspot.com",
          messagingSenderId: "626305865039",
          appId: "1:626305865039:web:95f9ba63165f37ca5f213a",
          measurementId: "G-705TWGZE1W"));
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<ContactProvider>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
