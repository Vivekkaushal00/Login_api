import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:login_api/home.dart';
import 'package:login_api/model/login_model/login_request.dart';
import 'package:login_api/model/login_model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginResponse loginResponse = LoginResponse();

  final dio = Dio();

  Future<Response?> login() async {
    final request = LoginRequest(
        email: emailController.text, password: passwordController.text);
    Response response = await dio.post(
      'https://api-evole.deploywork.com/api/auth/login',
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(response.data);
      print("login token----->${loginResponse.data?.token}");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );

    } else {
      print(response.statusCode);
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  String username = '';
  String password = '';
  bool isLoggedIn = false;

  Future<void> loginUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isLoggedIn', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home(),)
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   checkLoginStatus();
  // }

  // Future<void> checkLoginStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   });
  //
  //   if (isLoggedIn) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Home()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (isLoggedIn) {
                    logout();
                  } else {
                    login();
                  }
                },
                child: Text('Login')),
          ],
        ),
      ),
    );
  }
}



