
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CupertinoColors.activeGreen,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          CustomPaint(
            painter: ShapesPainter(),
            child: Container(
              width: double.infinity,
              height: 400,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    'Login with Bloc pattern',
                    style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          Column(
            children: <Widget>[
              // FORM LOGIN VIEW
              Container(
                margin: EdgeInsets.fromLTRB(25, 150, 25, 8),
                height: 400,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: CupertinoColors.white),
                child: Column(
                  children: <Widget>[
                    //EMAIL ADDRESS LABEL
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 30, 12, 8),
                      width: double.infinity,
                      child: Text(
                        'Email address',
                        style: TextStyle(color: CupertinoColors.black),
                      ),
                    ),
                    //EMAIL ADDRESS FIELD
                    emailField(),
                    //PASSWORD LABEL
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 30, 25, 6),
                      width: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Password',
                                style: TextStyle(color: CupertinoColors.black),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Text('Forgot?',
                                    style: TextStyle(
                                        color: CupertinoColors.activeGreen,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    //PASSWORD FIELD
                    passwordField(),
                    //SIGN IN BUTTON
                    signInButton(),
                    //or
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 8, 30, 8),
                        child: Center(
                          child: Text(
                            'Or',
                            style: TextStyle(color: CupertinoColors.black),
                          ),
                        )),
                    // google login button
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      child: (RaisedButton(
                        padding: EdgeInsets.all(12),
                        color: CupertinoColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromRGBO(21, 74, 25, 1))),
                        onPressed: () {},
                        child: Text(
                          'Sign in with Google',
                          style:
                              TextStyle(color: Color.fromRGBO(21, 74, 25, 1)),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(65, 0, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color.fromRGBO(21, 74, 25, 1),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
          // do not have account flatButton
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(30, 0, 30, 6),
            child: CupertinoTextField(
              onChanged: bloc.changeEmail,
              clearButtonMode: OverlayVisibilityMode.editing,
              style: TextStyle(color: CupertinoColors.black),
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: const Icon(
                  CupertinoIcons.info,
                  size: 21.0,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              suffixMode: _showError(snapshot.error),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: CupertinoColors.inactiveGray, width: 1))),
            ));
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(30, 0, 30, 8),
            child: CupertinoTextField(
              obscureText: true,
              onChanged: bloc.changePassword,
              suffix: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: const Icon(
                  CupertinoIcons.info,
                  size: 21.0,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              clearButtonMode: OverlayVisibilityMode.editing,
              style: TextStyle(color: CupertinoColors.black),
              suffixMode: _showError(snapshot.error),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: CupertinoColors.inactiveGray, width: 1))),
            ));
      },
    );
  }

  Widget signInButton(){
    return StreamBuilder(
      stream: bloc.submitValidation,
      builder: (context,snapshot){
        return Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(30, 8, 30, 8),
          child: (RaisedButton(
            padding: EdgeInsets.all(12),
            color: Color.fromRGBO(21, 74, 25, 1),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
            ),
            child: Text(
              'Sign in',
              style: TextStyle(color: CupertinoColors.white),
            ), onPressed: snapshot.hasData ? bloc.submit : null,
          )),
        );
      },
    );
  }

  OverlayVisibilityMode _showError(String message) {
    if (message != null) {
      return OverlayVisibilityMode.always;
    } else {
      return OverlayVisibilityMode.never;
    }
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    // paint.color = Color.fromRGBO(21, 74, 25, 200);
    // Create a rectangle with size and width same as the canvas
    // var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    // canvas.drawRect(rect, paint);
    paint.color = Color.fromRGBO(21, 74, 25, 1);
    // create a path
    var path = Path();
    path.lineTo(0, 200);
    path.lineTo(size.width, 350);
    path.lineTo(size.width, 0);
    // close the path to form a bounded shape
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
