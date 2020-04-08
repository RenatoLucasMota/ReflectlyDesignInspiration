import 'package:flutter/material.dart';
import 'package:reflectly_inspiration/logo_widget.dart';

class AnimationItem {
  final String name;
  final Tween<double> tween;

  AnimationItem({this.name, this.tween});
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<AnimationItem> animationlist = [];

  @override
  void initState() {
    super.initState();
    delayAnimatiom(AnimationItem(
          name: 'logo_scale',
          tween: Tween<double>(begin: 0.0, end: 0.8),
        ),
        Duration(milliseconds: 1200));
    delayAnimatiom(AnimationItem(
          name: 'padding_top_label',
          tween: Tween<double>(begin: 0.0, end: 1),
        ),
        Duration(milliseconds: 800));
    delayAnimatiom(AnimationItem(
          name: 'button_scale',
          tween: Tween<double>(begin: 0.0, end: 0.9),
        ),
        Duration(milliseconds: 1400));
  }

  Tween findAnimation(String name, double initialValue) {
    try {
      if (animationlist.length > 0) {
      var tween = animationlist.where((element) => element.name == name);
      return tween == null ? Tween<double>(begin: initialValue, end: initialValue) : tween.first.tween;
    } else {
      return Tween<double>(begin: initialValue, end: initialValue);
    }
    } catch (e) {
      return Tween<double>(begin: initialValue, end: initialValue);
    }
  }

  Future<void> delayAnimatiom(AnimationItem animation, Duration duration) async {
    await Future.delayed(duration, () {});
    setState(() {
      animationlist.add(animation);
    });
  }

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TweenAnimationBuilder(
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeOutCubic,
                          tween: findAnimation('padding_top_label', 20),
                          builder: (context, value, child) {
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                      top: _height * 0.32 + value),
                                  child: AnimatedOpacity(
                                    opacity: value == 20 ? 0 : 1,
                                    duration: Duration(milliseconds: 700),
                                    child: Text(
                                      'Olá humano,',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  child: AnimatedOpacity(
                                    opacity: value == 20 ? 0 : 1,
                                    duration: Duration(milliseconds: 800),
                                    child: Text(
                                      'eu sou Reflectly',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TweenAnimationBuilder(
                                    duration: Duration(milliseconds: 1200),
                                    curve: Curves.easeOutCubic,
                                    tween:
                                        findAnimation('padding_top_label', 20),
                                    builder: (context, paddingvalue, child) {
                                      return AnimatedOpacity(
                                        opacity: paddingvalue == 20 ? 0 : 1,
                                        duration: Duration(milliseconds: 1300),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30,
                                              right: 30,
                                              top: 15 + paddingvalue),
                                          child: Text.rich(
                                            TextSpan(
                                              text:
                                                  'Seu novo companheiro de \n',
                                              children: [
                                                TextSpan(
                                                  text: 'rotina e jornada',
                                                )
                                              ],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white70),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            );
                          }),
                      TweenAnimationBuilder(
                          child: LogoWidget(),
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.elasticOut,
                          tween: findAnimation('button_scale', 0.0),
                          builder: (context, value, child) {
                            return
                            Transform.scale(
                              scale: value,
                                                          child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 30),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(0, 10),
                                                blurRadius: 15),
                                          ],
                                        ),
                                        height: _height * 0.075,
                                        child: RaisedButton(
                                          hoverColor: Colors.white,
                                          hoverElevation: 0,
                                          highlightColor: Colors.white,
                                          highlightElevation: 0,
                                          elevation: 0,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          onPressed: () {},
                                          child: Text(
                                            'OLÁ, REFLECTLY',
                                            style:
                                                TextStyle(color: Colors.indigo),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
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
              duration: Duration(milliseconds: 2000),
              curve: Curves.elasticOut,
              tween: findAnimation('button_scale', 0.0),
              builder: (context, value, child) {
                return Positioned(
                  top: _height * 0.15,
                  child: Transform.scale(scale: value, child: child),
                );
              }),
        ],
      ),
    );
  }
}
