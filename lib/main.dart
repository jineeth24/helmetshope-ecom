import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:helmetshope/providers/admin_category_provider.dart';
import 'package:helmetshope/providers/category_dropdown_provider.dart';
import 'package:helmetshope/providers/product_provider.dart';
import 'package:helmetshope/screens/admin_home_screen.dart';
import 'package:helmetshope/screens/signup_screen.dart';
import 'package:helmetshope/services/auth_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryDropdownProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AdminHomeScreen(),
      ),
    );
  }
}
