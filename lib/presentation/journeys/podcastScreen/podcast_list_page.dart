import 'package:dsc_event/di/get_it.dart';
import 'package:dsc_event/domain/entities/podcast_entity.dart';
import 'package:dsc_event/presentation/blocs/podcast/pod_cast_cubit.dart';
import 'package:dsc_event/presentation/journeys/podcastScreen/podcast_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodCastPage extends StatefulWidget {
  final Function(PodCastEntity) podCast;

  const PodCastPage({Key? key, required this.podCast}) : super(key: key);

  @override
  _PodCastPageState createState() => _PodCastPageState();
}

class _PodCastPageState extends State<PodCastPage> {
  late PodCastCubit _podCastCubit;
  List<PodCastEntity> _podCastList = List.empty(growable: true);
  bool isLoading = false;

  @override
  void initState() {
    _podCastCubit = getItInstance<PodCastCubit>();
    _podCastCubit.loadPodCast();
    super.initState();
  }

  @override
  void dispose() {
    _podCastCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _podCastCubit,
        builder: (context, state) {
          if (state is PodCastInitial ||
              state is PodCastLoading && _podCastList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PodCastLoaded) {
            if (_podCastList.isEmpty) _podCastList.addAll(state.podCastEntity);
          } else if (state is MorePodCastLoading) {
            isLoading = true;
          } else if (state is MorePodCastLoaded) {
            isLoading = false;
            if (state.podCastEntity.isNotEmpty) {
              _podCastList.addAll(state.podCastEntity);
            }
          } else if (state is PodCastError) {
            return Container();
          }
          return PodCastList(
            onComplete: () {
              _podCastCubit.loadMorePodCast();
            },
            onTap: (data) {
              widget.podCast(data);
            },
            isLoading: isLoading,
            list: _podCastList,
          );
        },
      ),
    );
  }
}
