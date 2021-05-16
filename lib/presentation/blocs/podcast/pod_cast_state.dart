part of 'pod_cast_cubit.dart';

@immutable
abstract class PodCastState extends Equatable {
  const PodCastState();

  @override
  List<Object> get props => [];
}

class PodCastInitial extends PodCastState {}

class PodCastLoading extends PodCastState {}

class PodCastLoaded extends PodCastState {
  final List<PodCastEntity> podCastEntity;

  const PodCastLoaded(this.podCastEntity);

  @override
  List<Object> get props => [podCastEntity];
}

class MorePodCastLoading extends PodCastState {}

class MorePodCastLoaded extends PodCastState {
  final List<PodCastEntity> podCastEntity;

  const MorePodCastLoaded(this.podCastEntity);

  @override
  List<Object> get props => [podCastEntity];
}

class PodCastError extends PodCastState {}
