import 'package:e_learning/src/core/utils/consts/screen_sizes.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerDemoApp extends StatefulWidget {
  const YoutubePlayerDemoApp({super.key});

  @override
  State<YoutubePlayerDemoApp> createState() => _YoutubePlayerDemoAppState();
}

class _YoutubePlayerDemoAppState extends State<YoutubePlayerDemoApp> {
  String youTubeLink = 'https://www.youtube.com/watch?v=a2uKphzsjMo';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    String? ytLinkToURL = YoutubePlayer.convertUrlToId(youTubeLink);
    _controller = YoutubePlayerController(
        initialVideoId: ytLinkToURL!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Scaffold(
            body: _buildYouTube(),
          );
        } else {
          return _buildBody(context);
        }
      },
    );
  }

  Scaffold _buildBody(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildYouTube(),
            vericalGab(val: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Course Name',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          // fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),
                  ),
                  vericalGab(val: 10.0),
                  Text(
                    'Course Name',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
            ),
            vericalGab(val: 20.0),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => _buildLectureItem(context),
                separatorBuilder: (context, index) => vericalGab(val: 30.0),
                itemCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLectureItem(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '1',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
          ),
        ),
        Expanded(
          // width: ScreenSizes.getWidth(context) - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'lecture title',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
              ),
              Text(
                'lecture title',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    // fontWeight: FontWeight.w500,
                    // fontSize: 22,
                    ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(
            Icons.check_circle_outline_outlined,
          ),
        )
      ],
    );
  }

  youtubeHierarchy() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(fit: BoxFit.fill, child: _buildYouTube()),
      ),
    );
  }

  YoutubePlayer _buildYouTube() {
    return YoutubePlayer(
      controller: _controller,
      // showVideoProgressIndicator: true,
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
  }
}
