import 'package:dsc_event/domain/entities/podcast_entity.dart';

class PodCast extends PodCastEntity {
  final String audioName;
  final String audioId;
  final String audioUrl;
  final String imageUrl;
  final String publisher;

  PodCast(
      {this.audioName,
      this.audioUrl,
      this.publisher,
      this.audioId,
      this.imageUrl})
      : super(
            audioName: audioName,
            audioUrl: audioUrl,
            publisher: publisher,
            imageUrl: imageUrl,
            audioId: audioId);

  factory PodCast.fromJson(Map<String, dynamic> json) {
    return PodCast(
        audioName: json['audioName'],
        publisher: json['publisher'],
        audioId: json['audioId'],
        imageUrl: json['imageUrl'],
        audioUrl: json['audioUrl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audioName'] = this.audioName;
    data['publisher'] = this.publisher;
    data['audioId'] = this.audioId;
    data['audioUrl'] = this.audioUrl;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  @override
  List<Object> get props => [audioId];
}
