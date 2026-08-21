import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'ad_full_screen_view.dart';
import 'package:video_player/video_player.dart';

class AdCardWidget extends StatefulWidget {
  const AdCardWidget({super.key});

  @override
  State<AdCardWidget> createState() => _AdCardWidgetState();
}

class _AdCardWidgetState extends State<AdCardWidget> {
  // 1. THIS IS THE LIST THAT NEEDS TO BE HERE
  final List<String> adAssets = [
    'images/ads/coke.jpg',
    'images/ads/jollibee.jpg',
    'videos/pancit.mp4',
    'images/ads/priceless.webp',
    'images/ads/lazada.png',
    'videos/spice.mp4',
    'images/ads/smart.png',
    'videos/cola.mp4',
  ];

  int _currentIndex = 0;
  Timer? _timer;
  VideoPlayerController? _videoController;
  bool _isMuted = true;

@override
  void initState() {
    super.initState();
    _loadAd(_currentIndex);
    _startTimer(); // Use the helper here
  }

  @override
  void dispose() {
    _timer?.cancel();
    _videoController?.dispose();
    super.dispose();
  }

void _showAdOverlay(BuildContext context) {
    _videoController?.pause();
    _timer?.cancel();

    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return AdFloatingView(
          assetPath: adAssets[_currentIndex],
          onClose: () {
            overlayEntry?.remove();
          },
          onNext: () {
            // This runs when they click the close button
            setState(() {
              _currentIndex = (_currentIndex + 1) % adAssets.length;
              _loadAd(_currentIndex);
            });
            _startTimer(); // Restart the 8-second timer from now
          },
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }
  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer to avoid duplicates
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % adAssets.length;
          _loadAd(_currentIndex);
        });
      }
    });
  }

  void _loadAd(int index) {
    _videoController?.dispose();
    if (adAssets[index].endsWith('.mp4')) {
      _videoController = VideoPlayerController.asset(adAssets[index])
        ..initialize().then((_) {
          _videoController!.setVolume(_isMuted ? 0.0 : 1.0); // ADD THIS
          _videoController!.play();
          _videoController!.setLooping(true);
          if (mounted) setState(() {});
        });
    }
  }

  @override
@override
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sponsored",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  // 1. The Ad Layer (Entire area clickable)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _showAdOverlay(context),
                    child: SizedBox.expand(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: adAssets[_currentIndex].endsWith('.mp4')
                            ? (_videoController?.value.isInitialized == true
                                ? IgnorePointer( // <--- THIS ALLOWS TAPS TO PASS THROUGH
                                    child: AspectRatio(
                                      aspectRatio: _videoController!.value.aspectRatio,
                                      child: VideoPlayer(_videoController!),
                                    ),
                                  )
                                : const Center(child: CircularProgressIndicator()))
                            : Image.asset(
                                adAssets[_currentIndex],
                                key: ValueKey<int>(_currentIndex),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      ),
                    ),
                  ),
                  
                  // 2. The Mute Button (On top, remains independently clickable)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
                        _isMuted ? Icons.volume_off : Icons.volume_up,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isMuted = !_isMuted;
                          _videoController?.setVolume(_isMuted ? 0.0 : 1.0);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
