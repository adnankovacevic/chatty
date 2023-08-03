import 'package:flutter/material.dart';

@immutable
class Story {
  const Story({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}
