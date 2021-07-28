import 'package:flutter/material.dart';

import '../../models/game_match.dart';
import '../match_container.dart';
import '../default_sized_box.dart';

class AthleteSchedule extends StatelessWidget {
  final List<GameMatch> matches = [
    GameMatch(
        title: 'MEN’S SINGLE SEMIFINAL 1',
        type: 'Para Badminton',
        description: 'INA VS MAS',
        location: 'ISA SPORTS CITY',
        startDate: DateTime.parse('2021-12-03 20:00:00'),
        endDate: DateTime.parse('2021-12-03 23:00:00'),
        image:
            'https://lh3.googleusercontent.com/proxy/LEJwr7fEsyYYWaMTOQB5GO5BbTdq7DvtlegTO33yL_zkwkyl8Wswp-F1ydzH4nQ5VSNRV7qeeidpe8fQYKrhM_eNaAELm106R3s7frFFIPPOgAnwUBebuLYRfTlW1izAHA'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        GameMatch match = matches[index];

        return Column(
          children: [
            InkWell(
              child: MatchContainer(
                match: match,
              ),
            ),
            DefaultSizedBox.vertical(15),
          ],
        );
      },
      itemCount: matches.length,
    );
  }
}
