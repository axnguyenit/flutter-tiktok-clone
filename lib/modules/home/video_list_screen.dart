// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tiktok/blocs/video_list/video_list_bloc.dart';
// import 'package:video_player/video_player.dart';

// class VideoListScreen extends StatefulWidget {
//   const VideoListScreen({super.key});

//   @override
//   State<VideoListScreen> createState() => _VideoListScreenState();
// }

// class _VideoListScreenState extends State<VideoListScreen> {
//   late VideoListBloc _videoListBloc;

//   @override
//   void initState() {
//     super.initState();
//     _videoListBloc = VideoListBloc()..add(VideoListRequested());
//   }

//   @override
//   void dispose() {
//     _videoListBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TikTok Video List'),
//       ),
//       body: BlocBuilder<VideoListBloc, VideoListState>(
//         builder: (context, state) {
//           if (state is VideoListLoadInProgress) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is VideoListLoadSuccess) {
//             return _buildVideoList(state.videos);
//           } else if (state is VideoListLoadFailure) {
//             return Center(
//               child: Text(
//                 state.message,
//                 style: const TextStyle(color: Colors.red, fontSize: 18),
//               ),
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildVideoList(List<Video> videos) {
//     return ListView.builder(
//       itemCount: videos.length,
//       itemBuilder: (context, index) {
//         return VideoItem(
//           video: videos[index],
//           onVideoEnd: () {
//             // TODO: Implement logic for playing the next video
//           },
//         );
//       },
//     );
//   }
// }

// // ===================================

// class VideoItem extends StatefulWidget {
//   final Video video;
//   final VoidCallback onVideoEnd;

//   const VideoItem({
//     Key? key,
//     required this.video,
//     required this.onVideoEnd,
//   }) : super(key: key);

//   @override
//   State<VideoItem> createState() => _VideoItemState();
// }

// class _VideoItemState extends State<VideoItem> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.video.videoUrl);
//     _initializeVideoPlayerFuture = _controller.initialize();

//     _controller.addListener(() {
//       if (_controller.value.position == _controller.value.duration) {
//         widget.onVideoEnd();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           FutureBuilder(
//             future: _initializeVideoPlayerFuture,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return VideoPlayer(_controller);
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//           Positioned.fill(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Text(
//                     widget.video.title,
//                     style: const TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           if (_controller.value.isPlaying) {
//                             _controller.pause();
//                           } else {
//                             _controller.play();
//                           }
//                         });
//                       },
//                       icon: Icon(
//                         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _controller.setVolume(0);
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.volume_off,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ===============
// // video model

// class Video {
//   final String id;
//   final String title;
//   final String videoUrl;
//   final String thumbnailUrl;
//   final int likes;
//   final int shares;
//   final int comments;

//   Video({
//     required this.id,
//     required this.title,
//     required this.videoUrl,
//     required this.thumbnailUrl,
//     required this.likes,
//     required this.shares,
//     required this.comments,
//   });

//   factory Video.fromJson(Map<String, dynamic> json) {
//     return Video(
//       id: json['id'],
//       title: json['title'],
//       videoUrl: json['video_url'],
//       thumbnailUrl: json['thumbnail_url'],
//       likes: json['likes'],
//       shares: json['shares'],
//       comments: json['comments'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'video_url': videoUrl,
//       'thumbnail_url': thumbnailUrl,
//       'likes': likes,
//       'shares': shares,
//       'comments': comments,
//     };
//   }
// }
