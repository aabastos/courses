import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/contact_item.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

class ContactsScreen extends StatefulWidget {
  static String id = 'contacts-screen';
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  User loggedInUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (err) {
      print(err);
    }
  }

  Widget contactsBuilder(context, snapshot) {
    if (!snapshot.hasData || snapshot.data.docs.length == 0)
      return Center(
        child: Text('Nenhum contato'),
      );

    final contacts = snapshot.data.docs;

    List<ContactItem> contactWidgets = [];
    for (var contact in contacts) {
      contactWidgets.add(new ContactItem(
        name: contact['contact_name'],
        email: contact['contact_email'],
        onPressed: () {
          Navigator.pushNamed(context, ChatScreen.id, arguments: contact);
        },
      ));
    }

    return ListView(
      children: contactWidgets,
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Contatos'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('contacts')
              .where('user', isEqualTo: loggedInUser.email)
              .snapshots(),
          builder: contactsBuilder,
        ),
      ),
    );
  }
}
