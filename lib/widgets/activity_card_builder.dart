import 'package:auto24/models/story.dart';
import 'package:auto24/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryCardBuilder extends StatelessWidget {
  const StoryCardBuilder({super.key, required this.story});

  final Story story;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(
          url: story.url,
        ),
        Text(
          story.name,
          style: GoogleFonts.lato(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
