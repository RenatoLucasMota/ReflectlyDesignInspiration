import 'package:flutter/material.dart';
import 'package:reflectly_inspiration/logo_widget.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.indigoAccent, Colors.indigo])),
          ),
          SizedBox(
            height: _height,
            width: _height,
            child: PageView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: _height * 0.34),
                        child: Text(
                          'Olá humano,',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          'eu sou Reflectly',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text.rich(
                          TextSpan(
                            text: 'Seu novo companheiro de \n',
                            children: [
                              TextSpan(
                                text: 'rotina e jornada',
                              )
                            ],
                            style:
                                TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          ),
          TweenAnimationBuilder(
              child: LogoWidget(),
              duration: Duration(milliseconds: 600),
              curve: Curves.elasticOut,
              tween: Tween<double>(begin: 0.0, end: 0.8),
              builder: (context, value, child) {
                return Positioned(
                  top: _height * 0.2,
                  child: Transform.scale(scale: value, child: child),
                );
              }),
        ],
      ),
    );
  }
}
