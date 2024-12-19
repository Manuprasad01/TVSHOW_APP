import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvshow/providers/provider.dart';

import 'screens/show_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: getProviders(), child: const TVShowApp()),
  );
}

class TVShowApp extends StatelessWidget {
  const TVShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Show App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ShowScreen(),
    );
  }
}
