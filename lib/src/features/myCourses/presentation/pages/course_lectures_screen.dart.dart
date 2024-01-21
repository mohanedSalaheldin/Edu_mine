import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/body_widget.dart';
import 'package:e_learning/src/features/myCourses/presentation/widgets/youtube_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseLecturesScreen extends StatefulWidget {
  final CourseEntity courseEntity;
  const CourseLecturesScreen({
    super.key,
    required this.courseEntity,
  });

  @override
  State<CourseLecturesScreen> createState() => _CourseLecturesScreenState();
}

class _CourseLecturesScreenState extends State<CourseLecturesScreen> {
  String youTubeLink = 'https://youtu.be/NDspie55GpI?si=QAJtp0cLy3IJt7CA';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    String? ytLinkToURL = YoutubePlayer.convertUrlToId(youTubeLink);
    _controller = YoutubePlayerController(
      initialVideoId: ytLinkToURL!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Scaffold(
            body: buildYouTube(controller: _controller),
          );
        } else {
          return buildBody(
            context: context,
            controller: _controller,
            courseEntity: widget.courseEntity,
          );
        }
      },
    );
  }
}
