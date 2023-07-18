import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Api {
  static dynamic _auth = FirebaseAuth.instance;
  static dynamic _firestore = FirebaseFirestore.instance;

  Api();

  Future<User> getCurrentUser() async {
    User loggedInUser;
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }

      return loggedInUser;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<dynamic> getUserData(String userEmail) async {
    try {
      final userData = await _firestore
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();
      return userData.docs[0].data();
    } catch (err) {
      print(err);
      return null;
    }
  }

  void sendMessage(sender, receiver, messageText, messageKey) async {
    final receiverContact = await _firestore
        .collection('contacts')
        .where('user', isEqualTo: receiver)
        .where('contact_email', isEqualTo: sender)
        .get();

    if (receiverContact.docs.length == 0) {
      try {
        dynamic senderUserData = await getUserData(sender);

        _firestore.collection('contacts').add({
          'user': receiver,
          'contact_email': sender,
          'contact_name': senderUserData['name'],
          'message_key': messageKey,
        });
      } catch (err) {
        print(err);
      }
    }

    _firestore.collection('messages').add({
      'text': messageText,
      'sender': sender,
      'receiver': receiver,
      'message_key': messageKey,
    });
  }
}
