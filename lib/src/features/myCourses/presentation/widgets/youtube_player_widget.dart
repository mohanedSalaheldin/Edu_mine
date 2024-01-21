 import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayer buildYouTube({required YoutubePlayerController controller }) {
    return YoutubePlayer(
      controller: controller,
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