import 'package:flutter/material.dart';
import 'package:reflectly_inspiration/utils/consts.dart';
import 'package:reflectly_inspiration/widgets/change_color.dart';
//import 'dart:math' as math;

class ThirdPage extends StatefulWidget {
  final ValueChanged<int> valueChanged;
  ThirdPage({Key key, this.valueChanged}) : super(key: key);
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.3);
  //double _offset = 0;
  double _currentindex = 0;
  @override
  void initState() {
    super.initState();
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
              'PODE SER MUDADO DEPOIS NAS CONFIGURAÇÕES',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: PageView(
                onPageChanged: (index){
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
          )
        ],
      ),
    );
  }
}
