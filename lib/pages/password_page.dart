import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key key}) : super(key: key);
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage>
    with AutomaticKeepAliveClientMixin {
  String _nikname = '';

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: _height * 0.23),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Escolha uma senha fácil de lembrar!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.only(top: _height * 0.22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      obscureText: true,
                      onChanged: (texto) {
                        setState(() {
                          _nikname = texto;
                        });
                      },
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white, fontSize: 21),
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          //labelText: '',
                          hintText: "Como será minha senha...",
                          hintStyle:
                              TextStyle(color: Colors.white54, fontSize: 18),
                          border: InputBorder.none),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'SUA SENHA',
                          style: TextStyle(fontSize: 14, color: Colors.white38),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '${_nikname.length} / 8',
                          style: TextStyle(fontSize: 14, color: Colors.white38),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
