// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tiktok/modules/home/video_list_screen.dart';

// part 'video_list_event.dart';
// part 'video_list_state.dart';

// class VideoListBloc extends Bloc<VideoListEvent, VideoListState> {
//   final CollectionReference _videosCollection = FirebaseFirestore.instance.collection('videos');


//   factory VideoListBloc.instance() {
//     final key = Keys.Blocs.authenticationBloc;

//     return EventBus().newBlocWithConstructor<VideoListBloc>(
//       key,
//       () => VideoListBloc(
//         key,
//         authenticationService: Provider().authenticationService,
//       ),
//     );
//   }

//   VideoListBloc() : super(VideoListInitial());

//   Stream<VideoListState> mapEventToState(
//     VideoListEvent event,
//   ) async* {
//     if (event is VideoListRequested) {
//       yield* _mapVideoListRequestedToState();
//     }
//   }

//   Stream<VideoListState> _mapVideoListRequestedToState() async* {
//     yield VideoListInitial();

//     try {
//       final querySnapshot = await _videosCollection.get();
//       final List<Video> videos =
//           querySnapshot.docs.map((doc) => Video.fromJson(doc.data() as Map<String, dynamic>)).toList();

//       yield VideoListLoadSuccess(videos: videos);
//     } catch (e) {
//       yield VideoListLoadFailure(message: e.toString());
//     }
//   }
// }
