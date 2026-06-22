// self_care.dart

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import '../../Utils/colors.dart';

class SelfCare extends StatefulWidget {
  const SelfCare({super.key});

  @override
  _SelfCareState createState() => _SelfCareState();
}

class _SelfCareState extends State<SelfCare> {
  late VideoPlayerController _videoController;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/images/foot_massage_video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        backgroundColor2,
        backgroundColor2,
        backgroundColor4,
      ],
    ),
    ),
    child: SafeArea(
    child: ListView(
    padding: const EdgeInsets.all(16.0),
    children: [
    const SizedBox(height: 20),
    const Text(
    "Self Care",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: Colors.brown,
    ),
    ),
    const SizedBox(height: 35),

       Column(
        children: [
          // Image on top
          Image.asset('assets/images/self_care_image.jpg'),
          const SizedBox(height: 20),

          const Text('Foot Massage to Relieve Cramps', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.brown,
          ),),
          const SizedBox(height: 10),
          // Row with video of foot massage
          Row(
            children: [
              Expanded(
                child: _videoController.value.isInitialized
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _videoController.value.isPlaying
                          ? _videoController.pause()
                          : _videoController.play();
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                )
                    : Container(),
              ),
            ],
          ),
          const SizedBox(height: 20),

          const Text('Soundscapes', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.brown,
          ),),
          const SizedBox(height: 10),
          // Row with Soundscapes having music
          Row(
            children: [
              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    ByteData byteData = await rootBundle.load('assets/images/relaxing_music.mp3');
                    Uint8List uint8List = byteData.buffer.asUint8List();
                    await _audioPlayer.play(BytesSource(uint8List));
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: const BorderSide(color: Colors.brown),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(const EdgeInsets.all(30)),
                  ),
                  child: const Text('Piano Music', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.brown,
                  )),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    ByteData byteData = await rootBundle.load('assets/images/relaxing_music2.mp3');
                    Uint8List uint8List = byteData.buffer.asUint8List();
                    await _audioPlayer.play(BytesSource(uint8List));
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: const BorderSide(color: Colors.brown),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(const EdgeInsets.all(30)),
                  ),
                  child: const Text('Whispered Lumina', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.brown,
                  )),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    ]),
      ),
    ),
    );
  }
}