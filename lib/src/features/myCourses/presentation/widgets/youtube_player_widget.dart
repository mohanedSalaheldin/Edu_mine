import '../cubit/mycourses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../injector.dart' as di;

//
class MyYouTubeWidget extends StatefulWidget {
  const MyYouTubeWidget({super.key, required this.url, required this.courseID});
  final String url;
  final String courseID;

  @override
  State<MyYouTubeWidget> createState() => _MyYouTubeWidgetState();
}

class _MyYouTubeWidgetState extends State<MyYouTubeWidget> {
  YoutubePlayerController? controller;
  @override
  void initState() {
    String ytLinkToURL = YoutubePlayer.convertUrlToId(widget.url)!;
    controller = YoutubePlayerController(
      initialVideoId: ytLinkToURL,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        forceHD: false,
        // hideThumbnail: true,
        // hideControls: true,
      ),
    );
    // widget.controller.
    super.initState();
  }

  @override
  void dispose() {
    if (controller!.value.isPlaying) controller!.pause();
    controller!.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    controller!.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MycoursesCubit>(),
      child: BlocConsumer<MycoursesCubit, MycoursesState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return YoutubePlayer(
            controller: controller!,
            onEnded: (metaData) {
              MycoursesCubit.get(context).setSectionAsWatched(
                courseID: widget.courseID,
                sectionURL: widget.url,
              );
              // controller.dispose();
            },
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                  playedColor: Colors.black,
                  backgroundColor: Colors.grey[500],
                  bufferedColor: Colors.white,
                ),
              ),
              RemainingDuration(),
              FullScreenButton(),
              // PlayPauseButton(),
            ],
          );
        },
      ),
    );
  }
}

// YoutubePlayer buildYouTube({
//   // required String youTubeLink,
//   required BuildContext context,

//   // required String courseID,
//   // required String sectionID,
// }) {}
