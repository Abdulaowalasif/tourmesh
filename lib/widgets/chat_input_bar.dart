
import 'package:flutter/material.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onAttachPressed;
  final VoidCallback? onCameraPressed;
  final String hintText;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    this.onAttachPressed,
    this.onCameraPressed,
    this.hintText = 'Type a message...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          if (onAttachPressed != null)
            IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.blue),
              onPressed: onAttachPressed,
            ),
          if (onCameraPressed != null)
            IconButton(
              icon: const Icon(Icons.camera_alt, color: Colors.blue),
              onPressed: onCameraPressed,
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: onSend,
            ),
          ),
        ],
      ),
    );
  }
}
