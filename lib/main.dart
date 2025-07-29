import 'package:flutter/material.dart';
import 'package:tourmesh_app/screens/splash_screen.dart';

void main() {
  runApp(const TourMeshApp());
}

class TourMeshApp extends StatelessWidget {
  const TourMeshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TourMesh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
