import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hq_personal_library/components/progress_dialog.dart';
import 'package:hq_personal_library/utils/colors.dart';
import 'package:hq_personal_library/utils/utils.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void loginUser() async{
    //Não houve tempo hábil para fazer, de fato, uma autenticação. Priorizei as demais funcionalidades do App.
    Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Sign In - Personal Library',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontFamily: 'Montserrat'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email address',
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle: TextStyle(color: Colors.grey)),
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        RaisedButton(color: kAccentColor, onPressed: () => loginUser(), child: Center(child: Text('SIGN IN'),),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


