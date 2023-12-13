import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_case/utils/common.dart';
import 'package:voco_case/utils/images.dart';
import 'package:voco_case/view/home_screen.dart';
import 'package:voco_case/view/login_screen.dart';
import '../Utils/colors.dart';
import '../utils/constant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late SharedPreferences localdata;
  bool? islogin;

  void init() async {
    localdata = await SharedPreferences.getInstance();
    islogin = (localdata.getBool('login') ?? false);
    print(islogin);
    if (islogin ?? false) {
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    else {
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => init());
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(

            ),
            Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: secondaryPrimaryColor.withOpacity
                            (0.0),
                          radius: 65.0,
                          child: Image.asset(
                            appLogo,
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            mAppName,
                            style: CustomStyle.primaryTextStyle
                          ),
                        ),
                      ],
                    ),
                  ),
                  spinkitSecondary,
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}