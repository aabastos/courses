import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/components/rounded_input.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration-screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool inAsync = false;

  String name;
  String email;
  String password;

  bool nameEmpty = false;
  bool emailEmpty = false;
  bool passwordEmpty = false;

  bool validateFields() {
    setState(() {
      if (this.name == '' || this.name == null)
        nameEmpty = true;
      else
        nameEmpty = false;

      if (this.email == '' || this.email == null)
        emailEmpty = true;
      else
        emailEmpty = false;

      if (this.password == '' || this.password == null)
        passwordEmpty = true;
      else
        passwordEmpty = false;
    });

    if (nameEmpty || emailEmpty || passwordEmpty) return false;

    return true;
  }

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
                hint: 'Digite o seu nome',
                type: TextInputType.name,
                onChanged: (value) => this.name = value,
                showError: nameEmpty,
                errorText: 'Preencha o nome',
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedInput(
                hint: 'Digite o seu email',
                type: TextInputType.emailAddress,
                onChanged: (value) => this.email = value,
                showError: emailEmpty,
                errorText: 'Preencha o email',
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedInput(
                hint: 'Digite sua senha',
                type: TextInputType.visiblePassword,
                obscure: true,
                onChanged: (value) => this.password = value,
                showError: passwordEmpty,
                errorText: 'Preencha a senha',
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Registrar',
                color: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    this.inAsync = true;
                  });
                  try {
                    if (validateFields()) {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: this.email,
                        password: this.password,
                      );

                      if (newUser != null) {
                        _firestore.collection('users').add({
                          'name': this.name,
                          'email': this.email,
                        });

                        Navigator.pushNamed(context, ChatScreen.id);
                      }
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
