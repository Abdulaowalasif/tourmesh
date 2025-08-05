import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/message_bubble.dart';
import 'call_screen.dart';
import 'chat_screen.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [
    Message(
      id: '1',
      text: 'Everyone ready for the museum tour?',
      sender: 'John',
      timestamp: '10:15 AM',
      delivered: true,
    ),
    Message(
      id: '2',
      text: 'Yes! Just got the audio guide files',
      sender: 'Mike',
      timestamp: '10:16 AM',
      delivered: true,
    ),
    Message(
      id: '3',
      text: "Perfect! Let's meet at the main entrance",
      sender: 'me',
      timestamp: '10:17 AM',
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

      // Simulate delivery confirmation
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
      appBar: CustomAppBar(
        title: 'Tour Group',
        subtitle: '3 members online',
        avatarText: 'T',
        onCallPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const CallScreen()));
        },
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.blue),
            onPressed: () {
              // More options action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isMe = message.sender == 'me';
                return MessageBubble(
                  message: message,
                  isMe: isMe,
                  showSenderName: !isMe,
                );
              },
            ),
          ),
          ChatInputBar(
            controller: _messageController,
            onSend: _sendMessage,
            onAttachPressed: () {
              // Attach file logic
            },
            onCameraPressed: () {
              // Camera logic
            },
            hintText: 'Broadcast to group...',
          ),
        ],
      ),
    );
  }
}
