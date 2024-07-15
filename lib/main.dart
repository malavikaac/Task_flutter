import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Data/user_detail_provider.dart';
import 'package:task/pages/home_Screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<UserDetailsProvider>(
          create: (context) =>  UserDetailsProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
