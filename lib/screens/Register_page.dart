import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {},
           child: Text('Login')
           
           ),
        ],
        //leading :Container(child: Image.asset('assets/images/icons/'),)
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          //const SizedBox(
          // height: 14,
          //),
          const Text(
            "Hi there, welcome to Ortho AI ",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xff15331b),
            ),
          ),
          const Text(
            "creating your account will take only few minutes to ensure to you a better experience ",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Color(0xffa0cca9),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                //suffixIcon: Icon(Icons.c),

                hintText: 'Sama Hany mo',
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(400),
                    bottomRight: Radius.circular(510),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(510),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          //padding: const EdgeInsets.symmetric(horizontal: 10),
          TextField(
            decoration: InputDecoration(
              //suffixIcon: Icon(Icons.c),

              hintText: 'Email address',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(510),
                  bottomRight: Radius.circular(510),
                  topLeft: Radius.circular(510),
                  topRight: Radius.circular(510),
                ),
                  borderSide: BorderSide(color: Color(0xff60aa6f))
              ),
            ),
          ),

          SizedBox(height: 80),

          TextField(
            decoration: InputDecoration(
              //suffixIcon: Icon(Icons.c),

              hintText: 'Continue',
              fillColor: Color(0XFF019B97),

              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.only(
                  
                  bottomLeft: Radius.circular(410),
                  bottomRight: Radius.circular(410),
                  topLeft: Radius.circular(410),
                  topRight: Radius.circular(410),
                  
                ),
              
              ),
            ),
          ),
        ],
      ),
    );
  }
}
