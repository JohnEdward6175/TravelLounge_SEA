import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String soundPath; // Add this

  const SoundButton({
    super.key, 
    required this.onPressed, 
    required this.child,
    this.soundPath = 'sounds/click.mp3', // Default sound
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await AudioPlayer().play(AssetSource(soundPath));
        onPressed();
      },
      child: child,
    );
  }
}