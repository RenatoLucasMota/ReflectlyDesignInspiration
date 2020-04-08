import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 8),
            blurRadius: 15,
          )
        ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: 6,
            top: -6,
            left: 0,
            bottom: 0,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 2,
              color: Colors.grey[400],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ))),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 15,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 4, left: 6, right: 6),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent.withOpacity(1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
