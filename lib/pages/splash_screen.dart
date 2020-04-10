import 'package:flutter/material.dart';
import 'package:reflectly_inspiration/pages/start_page.dart';
import 'package:reflectly_inspiration/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openStartPage();
  }

  openStartPage() async {
    await Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StartPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Transform.scale(
              scale: 1.2,
              child: LogoWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
