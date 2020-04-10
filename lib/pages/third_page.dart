import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reflectly_inspiration/pages/start_page.dart';
import 'package:reflectly_inspiration/utils/consts.dart';
import 'package:reflectly_inspiration/widgets/change_color.dart';
//import 'dart:math' as math;

class ThirdPage extends StatefulWidget {
  final ValueChanged<int> valueChanged;
  final int initialIndex;
  ThirdPage({Key key, this.valueChanged, this.initialIndex}) : super(key: key);
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with AutomaticKeepAliveClientMixin {
  PageController _pageController;

  //double _offset = 0;
  double _currentindex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: widget.initialIndex ?? 0, viewportFraction: 0.3);
    _pageController.addListener(() {
      setState(() {
        //_offset = _pageController.offset;
        _currentindex = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    //double _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: _height * 0.23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'Escolha a cor que mais te representa!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'NÃO SE PREOCUPE ISSO PODE SER ALTERADO DEPOIS',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  widget.valueChanged(index);
                },
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                pageSnapping: true,
                children: <Widget>[
                  ChangeColor(
                    onTap: () {
                      widget.valueChanged(_pageController.page.round());
                    },
                    //_height * 0.20
                    offset: _currentindex,
                    index: 0,
                    linearGradient: listColors[0],
                  ),
                  ChangeColor(
                    offset: _currentindex,
                    index: 1,
                    linearGradient: listColors[1],
                    onTap: () {
                      widget.valueChanged(_pageController.page.round());
                    },
                  ),
                  ChangeColor(
                    index: 2,
                    offset: _currentindex,
                    linearGradient: listColors[2],
                    onTap: () {
                      widget.valueChanged(_pageController.page.round());
                    },
                  ),
                  ChangeColor(
                    offset: _currentindex,
                    index: 3,
                    linearGradient: listColors[3],
                    onTap: () {
                      widget.valueChanged(_pageController.page.round());
                    },
                  ),
                  ChangeColor(
                    offset: _currentindex,
                    index: 4,
                    linearGradient: listColors[4],
                    onTap: () {
                      widget.valueChanged(_pageController.page.round());
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 0.8),
              duration: Duration(milliseconds: 1000),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
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
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                'TERMINEI',
                                style: TextStyle(
                                  color: listColors[_currentindex.round()]
                                      .colors[1],
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
