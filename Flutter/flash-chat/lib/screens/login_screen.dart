import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/rounded_input.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool inAsync = false;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: this.inAsync,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 300.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedInput(
                hint: 'Digite o seu email',
                type: TextInputType.emailAddress,
                onChanged: (value) => this.email = value,
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedInput(
                hint: 'Digite sua senha',
                type: TextInputType.visiblePassword,
                obscure: true,
                onChanged: (value) => this.password = value,
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Login',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    this.inAsync = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: this.email, password: this.password);

                    if (user != null) {
                      Navigator.pushNamed(context, ContactsScreen.id);
                    }
                  } catch (err) {
                    print(err);
                  } finally {
                    setState(() {
                      this.inAsync = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
