import 'package:flutter/material.dart';
import 'package:reflectly_inspiration/pages/first_page.dart';
import 'package:reflectly_inspiration/pages/password_page.dart';
import 'package:reflectly_inspiration/pages/second_page.dart';
import 'package:reflectly_inspiration/pages/third_page.dart';
import 'package:reflectly_inspiration/utils/animation_item.dart';
import 'package:reflectly_inspiration/utils/consts.dart';
import 'package:reflectly_inspiration/widgets/logo_widget.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  PageController _pageController;
  List<AnimationItem> animationlist = [];
  Tween<double> postionLogo;
  int _currentIndex;
  int _currentIndexColor = 0;
  Tween _animacaoColor;
  @override
  void initState() {
    super.initState();
    setState(() {});
    delayAnimatiom(
        AnimationItem(
          name: 'logo_scale',
          tween: Tween<double>(begin: 0.0, end: 0.8),
        ),
        Duration(milliseconds: 800), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
    _pageController = PageController(initialPage: 0);
    postionLogo = Tween(begin: 0.0, end: 0.0);
    _animacaoColor = Tween(begin: 2.3, end: 2.3);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      extendBody: true,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _currentIndexColor != null
                      ? listColors[_currentIndexColor]
                      : null),
            ),
            builder: (BuildContext context, value, Widget child) {
              return Transform.scale(scale: value, child: child);
            },
            tween: _animacaoColor,
          ),
          SizedBox(
            height: _height,
            width: _height,
            child: PageView(
              physics: NeverScrollableScrollPhysics(parent: null),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  switch (index) {
                    case 0:
                      postionLogo = Tween(begin: 0.0, end: 0.0);
                      break;
                    default:
                      postionLogo = Tween(begin: 0.0, end: 0.25);
                  }
                });
              },
              scrollDirection: Axis.vertical,
              children: <Widget>[
                FirstPage(
                  pageController: _pageController,
                  buttonColor: listColors[_currentIndexColor].colors[1],
                ),
                SecondPage(),
                PasswordPage(),
                ThirdPage(
                  valueChanged: (index) {
                    setState(() {
                      _animacaoColor = Tween(begin: 4.0, end: 0.0);
                      _currentIndexColor = index;
                      _animacaoColor = Tween(begin: 0.0, end: 2.3);
                    });
                  },
                ),
              ],
            ),
          ),
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            curve:
                _currentIndex == null ? Curves.elasticOut : Curves.easeInCubic,
            tween: postionLogo,
            builder: (BuildContext context, animation, Widget child) {
              return AnimatedPositioned(
                duration: Duration(milliseconds: 400),
                top: _height * 0.10,
                left: _currentIndex == null || _currentIndex == 0
                    ? _width / 2 - (100 / 2)
                    : 15,
                child: TweenAnimationBuilder(
                  child: LogoWidget(),
                  duration: Duration(milliseconds: 400),
                  curve: Curves.elasticOut,
                  tween: findAnimation('logo_scale', 0.0, animationlist),
                  builder: (context, value, child) {
                    return Transform.scale(
                        scale: value - animation, child: child);
                  },
                ),
              );
            },
          ),
          AnimatedPositioned(
            top: _height * 0.85,
            right: _currentIndex == null || _currentIndex == 0 ? -40 : 10,
            width: 40,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.expand_less,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    _pageController.animateToPage(_currentIndex - 1,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInCubic);
                  },
                ),
                SizedBox(
                  height: 0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.expand_more,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pageController.animateToPage(_currentIndex + 1,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInCubic);
                  },
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            top: _height * 0.15,
            right: _currentIndex == null || _currentIndex == 0 ? -40 : 10,
            width: 40,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            child: Column(
              children: <Widget>[
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: _currentIndex == 1 ? Colors.white : Colors.white54,
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 8,
                  width: 68,
                  decoration: BoxDecoration(
                      color: _currentIndex == 2 ? Colors.white : Colors.white54,
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: _currentIndex == 3 ? Colors.white : Colors.white54,
                      shape: BoxShape.circle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
