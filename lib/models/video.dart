import 'entity.dart';

class Video extends Entity {
  final String username;
  final String uid;
  final String id;
  final List likes;
  final int comments;
  final int shares;
  final String songName;
  final String caption;
  final String videoUrl;
  final String thumbnail;
  final String avatar;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.avatar,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      username: json['username'],
      uid: json['uid'],
      id: json['id'],
      likes: json['likes'],
      comments: json['comments'],
      shares: json['shares'],
      songName: json['songName'],
      caption: json['caption'],
      videoUrl: json['videoUrl'],
      thumbnail: json['thumbnail'],
      avatar: json['avatar'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'songName': songName,
      'caption': caption,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'avatar': avatar,
    };
  }

  @override
  List<Object> get props => [id];
}
