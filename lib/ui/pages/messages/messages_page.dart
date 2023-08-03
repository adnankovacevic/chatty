import 'package:auto24/config/app_colors.dart';
import 'package:auto24/config/helpers.dart';
import 'package:auto24/models/message.dart';
import 'package:auto24/widgets/avatar.dart';
import 'package:auto24/widgets/recent_activities_list_builder.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: RecentActivitiesListBuilder()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 3,
              (context, index) {
                final faker = Faker();
                final date = Helpers.randomDateTime();
                return MessageItemCard(
                  message: Message(
                    name: faker.person.name(),
                    dateOfMessage: date,
                    sendedAt: Jiffy.parseFromDateTime(date).fromNow(),
                    avatar: Helpers.radnomImageUrl(),
                    message: faker.lorem.sentence(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MessageItemCard extends StatelessWidget {
  const MessageItemCard({
    super.key,
    required this.message,
  });

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.textFaded, width: 0.4),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Avatar.medium(
              url: Helpers.radnomImageUrl(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message.name,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).primaryTextTheme.bodyMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.4),
                ),
                SizedBox(
                  height: 30,
                  child: Text(
                    message.message,
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        letterSpacing: 0.2,
                        textStyle:
                            Theme.of(context).primaryTextTheme.bodySmall),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.sendedAt,
                  style: GoogleFonts.lato(fontSize: 10),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: GoogleFonts.lato(
                        fontSize: 8,
                        color: AppColors.textColorLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
