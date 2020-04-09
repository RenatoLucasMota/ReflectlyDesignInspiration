import 'package:flutter/material.dart';
import 'package:reflectly_inspiration/pages/first_page.dart';
import 'package:reflectly_inspiration/utils/animation_item.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
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
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            curve:
                _currentIndex == null ? Curves.elasticOut : Curves.easeOutCubic,
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
                  duration: Duration(milliseconds: 1000),
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
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeOutCubic);
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
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeOutCubic);
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
                    shape: BoxShape.circle
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  height: 8,
                  width: 68,
                  decoration: BoxDecoration(
                    color: _currentIndex == 2 ? Colors.white : Colors.white54,
                    shape: BoxShape.circle
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == 3 ? Colors.white : Colors.white54,
                    shape: BoxShape.circle
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
