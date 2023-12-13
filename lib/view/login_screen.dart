import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_case/services/participants_service.dart';
import 'package:voco_case/utils/common.dart';
import 'package:voco_case/utils/constant.dart';
import 'package:voco_case/utils/images.dart';
import 'package:voco_case/utils/sharedprefs.dart';
import 'package:voco_case/view/home_screen.dart';

import '../Utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  late SharedPreferences localdata;
  bool circular = true;
  bool? isOnline;

  void init() async {
    localdata = await SharedPreferences.getInstance();
  }

  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: Image.asset(
                                 appLogo,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                mAppName,
                                style: CustomStyle.primaryTextStyle
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            //  border: Border.all(width: 1, color: colors.secondcolor),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Hoşgeldiniz',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: thirdPrimaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _emailcontroller,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Kullanıcı Adı',
                                  hintStyle: const TextStyle(
                                    color: secondaryPrimaryColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                         //             color: Theme.of(context).primaryColor,
                        //              width: 3,
                                    ),
                                  ),
                                  prefixIcon: const IconTheme(
                                    data: IconThemeData(
                                      color: secondaryPrimaryColor,
                                    ),
                                    child: Icon(Icons.person_rounded, size:
                                    18,),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: _passwordcontroller,
                                autocorrect: true,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Şifre',
                                  hintStyle: const TextStyle(
                                    color: secondaryPrimaryColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                          //            color: Theme.of(context).primaryColor,
                            //          width: 3,
                                    ),
                                  ),
                                  prefixIcon: const IconTheme(
                                    data: IconThemeData(
                                      color: secondaryPrimaryColor,
                                    ),
                                    child: Icon(Icons.lock, size: 18,),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      circular = false;
                                      Timer(const Duration(seconds: 20), () {
                                        if (isOnline != true) {
                                          showAlertDialog2(context, "Uyarı", 'Bağlantı Hatası');
                                          circular = true;
                                        }
                                      });

                                      ParticipantsService.otpLogin(_emailcontroller.text, _passwordcontroller.text).then((dynamic result) async {
                                        if (result == null) {
                                          setState(() {
                                            showAlertDialog2(context, "Uyarı", 'Bağlantınızı kontrol edin');
                                            circular = true;
                                          });
                                        }
                                        else if (result["token"] != null ) {
                                          localdata.setBool('login', true);
                                          localdata.setString('token', result["token"]);
                                          token = result["token"] ?? '';
                                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                                 builder: (context) => HomeScreen()), (_) => false);
                                         }
                                         else {
                                           setState(() {
                                             circular = true;
                                             showAlertDialog2(context, "Dikkat", result["error"]);
                                         });
                                       }
                                     });
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: secondaryPrimaryColor
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Giriş Yap',
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 25,
                                          color: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              circular == false
                                  ? const Center(child: spinkitSecondary)
                                  : const Text('')
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
