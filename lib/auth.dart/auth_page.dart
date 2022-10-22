import 'package:fap/api/api_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 76, 167),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Authorization",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Form(
                    key: key,
                    child: TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Login';
                        }
                        if (!value.contains("@") && !value.contains(".")) {
                          return "It's not Email, please check";
                        }
                      }),
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 253, 253, 253)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: key1,
                    child: TextFormField(
                      obscureText: true,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        }
                        if (value.length < 6) {
                          return 'Not correct passsword, return please';
                        }
                      }),
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 253, 253, 253)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      elevation: MaterialStateProperty.all(5)),
                  onPressed: () {
                    if (key.currentState!.validate() ||
                        key1.currentState!.validate()) {
                      Navigator.pushNamed(context, '/a');
                      ApiCubit().getConfig();
                    }
                  },
                  child: Text("Enter")),
            )
          ],
        ),
      ),
    );
  }
}
