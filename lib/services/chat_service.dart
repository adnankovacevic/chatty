import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');

  // Function to send a message to Firestore
  Future<void> sendMessage(String text, String sender) async {
    await messagesCollection.add({
      'text': text,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Add other chat-related functions here, if needed
}
