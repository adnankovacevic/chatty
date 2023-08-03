import 'package:flutter/material.dart';

@immutable
class Message {
  const Message({
    required this.name,
    required this.dateOfMessage,
    required this.sendedAt,
    required this.avatar,
    required this.message,
  });

  final String name;
  final DateTime dateOfMessage;
  final String sendedAt;
  final String avatar;
  final String message;
}
