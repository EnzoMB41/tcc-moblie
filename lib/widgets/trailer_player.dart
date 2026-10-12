import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../cores.dart';

class TrailerPlayer extends StatefulWidget {
  const TrailerPlayer({super.key});

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/trailer.mp4');
    // Atualiza a tela sempre que o vídeo muda como play, pausa, etc sla
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose(); // libera o vídeo ao sair da tela
    super.dispose();
  }

  void _alternar() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final v = _controller.value;

    return AspectRatio(
      aspectRatio: v.isInitialized ? v.aspectRatio : 16 / 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Cores.roxoBorda, width: 4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (v.hasError)
                const Text(
                  'Não foi possível carregar o vídeo',
                  style: TextStyle(color: Colors.white),
                )
              else if (v.isInitialized)
                VideoPlayer(_controller)
              else
                const CircularProgressIndicator(color: Colors.white),

              // Tocar em qualquer lugar do vídeo da play ou pause
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: v.isInitialized ? _alternar : null,
                  child: Center(
                    child: (v.isInitialized && !v.isPlaying)
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 48,
                            ),
                          )
                        : null,
                  ),
                ),
              ),

              // Barra de progresso (dá pra arrastar hehe)
              if (v.isInitialized)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Cores.rosa,
                      bufferedColor: Colors.white38,
                      backgroundColor: Colors.white24,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}