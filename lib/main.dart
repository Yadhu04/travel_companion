import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_companion/firebase_options.dart';
import 'package:travel_companion/provider/info_provider.dart';
import 'package:travel_companion/provider/location_provider.dart';
import 'package:travel_companion/provider/profile_provider.dart';
import 'package:travel_companion/provider/theme_provider.dart';
import 'package:travel_companion/screens/home_page.dart';
// import 'package:travel_companion/screens/test_screen.dart';w

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LocationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => InfoProvider(),
    )
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<Themeprovider>(context).themedata,
        home: const HomePage());
  }
}
