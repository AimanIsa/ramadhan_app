import 'package:flutter/material.dart';

import 'package:ramadhan_app/constant.dart';
import 'package:ramadhan_app/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //SizedBox
              const SizedBox(
                height: 300,
              ),

              const Image(
                image: AssetImage('lib/images/mosque.png'),
                width: 100,
              ),

              const SizedBox(
                height: 10,
              ),
              Text(
                'Ramadhan Kareem',
                style: TextStyle(
                    fontSize: 20,
                    color: darkgreen,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
