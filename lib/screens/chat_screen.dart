import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/message_bubble.dart';
import 'call_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [
    Message(
      id: '1',
      text: 'Hey! Are you ready for the tour?',
      sender: 'John',
      timestamp: '10:30 AM',
      delivered: true,
    ),
    Message(
      id: '2',
      text: 'Yes, just finished setting up. Where should we meet?',
      sender: 'me',
      timestamp: '10:32 AM',
      delivered: true,
    ),
    Message(
      id: '3',
      text: "Let's meet at the main entrance",
      sender: 'John',
      timestamp: '10:33 AM',
      delivered: true,
    ),
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(
          Message(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            text: text,
            sender: 'me',
            timestamp: TimeOfDay.now().format(context),
            delivered: false,
          ),
        );
      });
      _messageController.clear();

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages[_messages.length - 1] = Message(
            id: _messages.last.id,
            text: _messages.last.text,
            sender: _messages.last.sender,
            timestamp: _messages.last.timestamp,
            delivered: true,
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: "John's Phone",
        subtitle: 'Online',
        avatarText: 'J',
        onCallPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CallScreen()));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isMe = message.sender == 'me';

                return MessageBubble(
                  message: message,
                  isMe: isMe,
                );
              },
            ),
          ),
          ChatInputBar(
            controller: _messageController,
            onSend: _sendMessage,
            onAttachPressed: () {
              // Attach file action
            },
            onCameraPressed: () {
              // Open camera action
            },
          ),
        ],
      ),
    );
  }
}
