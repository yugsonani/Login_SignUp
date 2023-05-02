import 'package:flutter/material.dart';
import 'package:login_sign_up/pdf.dart';
import 'package:login_sign_up/splash.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';
import 'create.dart';
import 'homepage.dart';
import 'item.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isSplashVisit = prefs.getBool('splashVisit') ?? false;
  bool? isLoginVisit = prefs.getBool('isLoggedIn') ?? false;
  runApp(
    MaterialApp(
      initialRoute: (isSplashVisit == false)
          ? 'splash'
          : (isLoginVisit == false)
              ? 'login'
              : 'homePage',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyApp(),
        'login': (context) => const Login(),
        'homePage': (context) => const HomePage(),
        'splash': (context) => const Splash(),
        'item': (context) => const Item(),
        'cart': (context) => const Cart(),
        'pdf': (context) => const Pdf(),
        'create': (context) => const Create()
      },
      // theme: ThemeData(
      //   textTheme: Theme.of(context).textTheme.apply(
      //     fontFamily: 'first',
      //   ),
      // ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Stationery App",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "learn ipsum is simply dummy text of the printing and typesetting industry make a type spaceman book",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: const Text("Next")),
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'asset/image/main.jpeg',
              height: 300,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
