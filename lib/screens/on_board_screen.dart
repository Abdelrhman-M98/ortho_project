import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ortho/components/Btn_widget.dart';
import 'package:ortho/screens/Login_page.dart';
import 'package:ortho/screens/Register_page.dart'; // Import BtnWidget correctly

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key}); // Correct constructor syntax

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Image(
                image: AssetImage("assets/images/icons/ortho_Logo.png"),
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Image(
                image: AssetImage(
                  "assets/images/photos/onBording.png",
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Welcome to Ortho AI",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w800,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                "Revolutionize your smile assessment with Ortho ai. AI-powered insights, personalized for you. Start now!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            BtnWidget(
              btnText: "Get started",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return RegisterPage();
                  },
                ));
              },
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LoginPage();
                        },
                      ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
