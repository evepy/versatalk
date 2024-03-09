import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

import '../secrets.dart';

final userId = Random().nextInt(1000).toString();

class VideoConferencePage extends StatefulWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  State<VideoConferencePage> createState() => _VideoConferencePageState();
}

class _VideoConferencePageState extends State<VideoConferencePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: Secrets
            .appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: Secrets
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: 'user_name_$userId',
        conferenceID: widget.conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
        ),
      ),
    );
  }
}
