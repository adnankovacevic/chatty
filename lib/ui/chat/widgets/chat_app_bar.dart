import 'package:auto24/config/helpers.dart';
import 'package:auto24/models/message.dart';
import 'package:auto24/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(
          url: Helpers.radnomImageUrl(),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              const SizedBox(height: 2),
              Text(
                'Online now',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
