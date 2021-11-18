import 'package:dsc_event/domain/entities/teamyear_entity.dart';
import 'package:dsc_event/presentation/journeys/teamScreen/team_card.dart';
import 'package:flutter/material.dart';

class TeamCardView extends StatefulWidget {
  final TeamYearEntity teamYear;
  final bool isCurrentTeam;

  const TeamCardView(
      {Key? key, required this.teamYear, required this.isCurrentTeam})
      : super(key: key);

  @override
  State<TeamCardView> createState() => _TeamCardViewState();
}

class _TeamCardViewState extends State<TeamCardView> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.isCurrentTeam;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!widget.isCurrentTeam)
                  Text(
                    "Current Team",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                else
                  Text("Team -${widget.teamYear.year}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                if (isExpanded)
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    child: Icon(
                      Icons.expand_more_outlined,
                    ),
                  )
                else
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    child: Icon(
                      Icons.expand_less_outlined,
                    ),
                  ),
              ],
            ),
          ),
          if (isExpanded)
            for (final item in widget.teamYear.teamList)
              TeamCard(
                teamEntity: item,
              )
        ],
      ),
    );
  }
}
