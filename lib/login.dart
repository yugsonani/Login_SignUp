import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'asset/image/login2.png',
              height: 50,
            ),
            const Text(
              "Stationery App",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              'asset/image/login.jpeg',
              height: 200,
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('create');
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.symmetric(horizontal: 68)),
                child: const Text("Create Account")),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.symmetric(horizontal: 100)),
                child: const Text("login")),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('homePage');
                },
                child: Text(
                  "skip",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
