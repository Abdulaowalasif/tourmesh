import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/build_action_button.dart';
import '../widgets/custom_appbar.dart';
import 'chat_screen.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool _isMuted = false;
  int _callDuration = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _callDuration++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _endCall() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = size.height > size.width;
    final w = size.width;
    final h = size.height;

    double avatarRadius = w * 0.18;
    double mainFont = w * 0.065;
    double timerFont = w * 0.045;
    double buttonIcon = w * 0.08;
    double buttonSpace = w * 0.12;
    double actionLabelFont = w * 0.038;

    avatarRadius = avatarRadius.clamp(50.0, 120.0);
    mainFont = mainFont.clamp(20.0, 36.0);
    timerFont = timerFont.clamp(14.0, 28.0);
    buttonIcon = buttonIcon.clamp(26.0, 46.0);
    buttonSpace = buttonSpace.clamp(30.0, 70.0);
    actionLabelFont = actionLabelFont.clamp(11.0, 18.0);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: "John's Phone",
        subtitle: 'On Call',
        avatarText: 'J',
        onCallPressed: _endCall,
        actions: [
          IconButton(
            icon:
                Icon(_isMuted ? Icons.mic_off : Icons.mic, color: Colors.blue),
            onPressed: () {
              setState(() => _isMuted = !_isMuted);
            },
            iconSize: buttonIcon,
            tooltip: _isMuted ? 'Unmute' : 'Mute',
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: h * 0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: Colors.blue[100],
                    child: Text(
                      'J',
                      style: TextStyle(
                        fontSize: avatarRadius * 0.9,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.03),
                  Text(
                    "John's Phone",
                    style: TextStyle(
                      fontSize: mainFont,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Text(
                    _formatDuration(_callDuration),
                    style: TextStyle(
                      fontSize: timerFont,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: h * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildActionButton(
                        icon: _isMuted ? Icons.mic_off : Icons.mic,
                        label: _isMuted ? 'Unmute' : 'Mute',
                        color: _isMuted ? Colors.red : Colors.blue,
                        background: Colors.blue.withOpacity(0.1),
                        onTap: () => setState(() => _isMuted = !_isMuted),
                        iconSize: buttonIcon,
                        fontSize: actionLabelFont,
                      ),
                      SizedBox(width: buttonSpace),
                      buildActionButton(
                        icon: Icons.call_end,
                        label: 'End',
                        color: Colors.white,
                        background: Colors.red,
                        onTap: _endCall,
                        iconSize: buttonIcon,
                        fontSize: actionLabelFont,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
