import 'package:equatable/equatable.dart';

class PodCastEntity extends Equatable {
  final String audioId;
  final String audioName;
  final String audioUrl;
  final String imageUrl;
  final String publisher;

  PodCastEntity(
      {required this.audioName,
      required this.audioId,
      required this.audioUrl,
      required this.imageUrl,
      required this.publisher});

  @override
  List<Object> get props => [audioUrl];
}
