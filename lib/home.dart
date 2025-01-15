import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:login_api/model/home_model/home_data.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();

  HomeData data = HomeData();

  void fetchUserData() async {
    Response response =
        await dio.get('https://api-evole.deploywork.com/api/auth/me',
            options: Options(headers: {
              'Authorization':
                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3N2NiZTc5ODQxMmNlN2MzYTViMTBkMiIsImlhdCI6MTczNjkzNjU4NywiZXhwIjoxNzM5NTI4NTg3fQ.xZmIPUEXTtNzuRtOvr0X0mSaifscWVeWgFAyCkp1MLY'
            }));

    if (response.statusCode == 200) {
      data = HomeData.fromJson(response.data);

      setState(() {
        fetchUserData();
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                  child: Icon(Icons.logout)),
            )
          ],
        ),
        body: data.data == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email : ${data.data?.user?.email}'),
                  Text('Full name : ${data.data?.user?.fullName}'),
                ],
                  ),
            ),
    );
  }
}
