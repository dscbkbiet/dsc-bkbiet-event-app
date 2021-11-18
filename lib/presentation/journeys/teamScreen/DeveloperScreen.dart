import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/presentation/blocs/teamList/team_list_cubit.dart';
import 'package:dsc_event/presentation/journeys/teamScreen/team_card_view.dart';
import "package:dsc_event/presentation/widgets/logo.dart";
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class DeveloperScreen extends StatefulWidget {
  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  late TeamListCubit _teamListCubit;

  @override
  void initState() {
    _teamListCubit = getItInstance<TeamListCubit>();
    _teamListCubit.loadTeam();
    super.initState();
  }

  @override
  void dispose() {
    _teamListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(
          height: 40,
        ),
        backgroundColor: Colors.grey.shade900,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<TeamListCubit, TeamListState>(
        bloc: _teamListCubit,
        builder: (context, state) {
          if (state is TeamListInitial || state is TeamListLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is TeamListLoaded)
            return ListView(
              children: state.team
                  .map((e) => TeamCardView(
                        teamYear: e,
                        isCurrentTeam:
                            state.team.indexOf(e) == state.team.length - 1,
                      ))
                  .toList(),
            );
          else if (state is TeamListError) {
            return Container();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
