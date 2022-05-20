import 'package:espaco_saude/dicas/ui/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:video_player/video_player.dart';

import '../dica.dart';

class Detail extends StatefulWidget {
  final Dica dica;

  const Detail(this.dica, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://downloads.jfal.jus.br/espaco-saude/dicas/dicas_saude.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolbar(),
      body: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        semanticContainer: true,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
                textColor: Colors.indigo,
                iconColor: Colors.indigo,
                leading: const Icon(Icons.notification_important),
                title: Text(
                  widget.dica.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  softWrap: true,
                )),
            Padding(
              padding: const EdgeInsets.all(26),
              child: _buildVideoPlayer(),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Html(
                  data: widget.dica.message,
                  style: {
                    "body": Style(
                      fontSize: const FontSize(16),
                    ),
                  },
                )),
          ],
        ),
      ),
    );
  }

  RenderObjectWidget _buildVideoPlayer() {
    if (_controller.value.isInitialized) {
      return _videoPlayer();
    }
    return const Center(child: CircularProgressIndicator());
  }

  Stack _videoPlayer() {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: InkWell(
            child: VideoPlayer(_controller),
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          ),
        ),
        IconButton(
          iconSize: 40,
          color: Colors.black45,
          icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
