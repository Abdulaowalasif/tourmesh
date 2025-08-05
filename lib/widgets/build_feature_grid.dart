import 'package:flutter/material.dart';

import '../screens/call_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/file_transfer_screen.dart';
import '../screens/group_chat_screen.dart';
import 'feature_card.dart';

Widget buildFeatureGrid(BuildContext context) {
  return GridView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1,
    ),
    children: [
      FeatureCard(
        icon: Icons.chat_bubble,
        title: '1-to-1 Chat',
        color: Colors.blue,
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const ChatScreen())),
      ),
      FeatureCard(
        icon: Icons.groups,
        title: 'Group Chat',
        color: Colors.green,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const GroupChatScreen())),
      ),
      FeatureCard(
        icon: Icons.phone,
        title: 'Voice Calls',
        color: Colors.purple,
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const CallScreen())),
      ),
      FeatureCard(
        icon: Icons.folder_shared,
        title: 'File Share',
        color: Colors.orange,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const FileTransferScreen())),
      ),
    ],
  );
}
