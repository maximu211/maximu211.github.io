import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() => runApp(const VideoApp());

class VideoApp extends StatelessWidget {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VideoScreen(),
    );
  }
}

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController? _controller;
  bool _videoStarted = false;

  void _startVideo() {
    setState(() {
      _videoStarted = true;
      _controller = YoutubePlayerController.fromVideoId(
        videoId: 'dQw4w9WgXcQ',
        autoPlay: true,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          loop: true,
          mute: false, // тепер можна вмикати зі звуком
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_videoStarted) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(400, 400), backgroundColor: Colors.white),
            onPressed: _startVideo,
            child: const Text(
              'Я КЛАСНА КНОПКА!!ТИКНИ НА МЕНЕ!!!!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
      );
    }

    return YoutubePlayerScaffold(
      controller: _controller!,
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'ХА, ДЕБІЛ, ТЕБЕ ЗАРІКРОЛИЛИ!!! ЛОХ',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          body: Center(
            child: SizedBox(width: double.infinity, height: 500, child: player),
          ),
        );
      },
    );
  }
}
