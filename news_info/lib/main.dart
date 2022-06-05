import 'package:flutter/material.dart';
import 'package:news_info/models/google_sign_in.dart';
import 'package:news_info/screen/page_home.dart';
import 'package:news_info/constants.dart';
import 'package:news_info/screen/onbording_screnn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showHomePage = prefs.getBool('showHomePage') ?? false;

  runApp(MyApp(showHomePage: showHomePage));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showHomePage}) : super(key: key);

  final bool showHomePage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'News',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: kPrimaryColor,
              appBarTheme: const AppBarTheme(
                color: kWhite,
              )),
          home: showHomePage ? const HomePage() : const OnBordingScreen(),
        ),
      );
}
