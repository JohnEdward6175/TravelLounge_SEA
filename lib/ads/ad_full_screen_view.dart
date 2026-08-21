import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class AdFloatingView extends StatefulWidget {
  final String assetPath;
  final VoidCallback onClose;
  final VoidCallback onNext; // 1. Add this

  const AdFloatingView({
    super.key,
    required this.assetPath,
    required this.onClose,
    required this.onNext, // 2. Add this
  });

  @override
  State<AdFloatingView> createState() => _AdFloatingViewState();
}

class _AdFloatingViewState extends State<AdFloatingView> {
  bool _canClose = false;
  double _progress = 0.0;
  Timer? _timer;
  VideoPlayerController? _videoController; // ADD THIS

  @override
  void initState() {
    super.initState();
    // 1. Existing Timer code...
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (mounted) setState(() {
        _progress += 0.01;
        if (_progress >= 1.0) { _canClose = true; timer.cancel(); }
      });
    });

    // 2. ADD THIS: Initialize video if it's an .mp4
    if (widget.assetPath.endsWith('.mp4')) {
      _videoController = VideoPlayerController.asset(widget.assetPath)
        ..initialize().then((_) {
          _videoController!.play();
          if (mounted) setState(() {});
        });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _videoController?.dispose(); // ADD THIS: Clean up memory
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  return Material(
    color: Colors.black.withOpacity(0.85),
    child: Center(
      // 1. Wrap in an InteractiveViewer or just a container if you want to lock it
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 2. The Ad Image - Now acts as the reference for the Stack
          widget.assetPath.endsWith('.mp4') && _videoController?.value.isInitialized == true
    ? AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: VideoPlayer(_videoController!),
      )
    : Image.asset(widget.assetPath, fit: BoxFit.contain),

          // 3. The Close Button (Positioned will now respect the Stack's bounds)
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
  onTap: _canClose 
    ? () {
        widget.onNext(); // Trigger the skip to next ad
        widget.onClose(); // Close the overlay
      } 
    : null,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        value: _progress,
                        color: Colors.greenAccent,
                        strokeWidth: 3,
                      ),
                    ),
                    Icon(_canClose ? Icons.close : Icons.timer, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          
          // 4. "Thank you" message
          if (_canClose)
             const Text("Thank you for your support!", 
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
}
