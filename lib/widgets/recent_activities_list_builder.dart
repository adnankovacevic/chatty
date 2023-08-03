import 'package:auto24/config/helpers.dart';
import 'package:auto24/models/story.dart';
import 'package:auto24/widgets/activity_card_builder.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentActivitiesListBuilder extends StatelessWidget {
  const RecentActivitiesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Activities',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).primaryTextTheme.bodyMedium,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                      child: SizedBox(
                        width: 60,
                        child: StoryCardBuilder(
                          story: Story(
                            name: faker.person.name(),
                            url: Helpers.radnomImageUrl(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
