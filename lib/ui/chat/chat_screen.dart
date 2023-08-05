import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot> messages = snapshot.data!.docs;
            return ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                // Explicitly specify the type of messageData as Map<String, dynamic>
                Map<String, dynamic> messageData =
                    messages[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(messageData['text'] ?? ''),
                  subtitle: Text(messageData['sender'] ?? ''),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
