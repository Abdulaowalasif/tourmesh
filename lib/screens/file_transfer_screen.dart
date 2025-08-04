import 'package:flutter/material.dart';
import '../models/file_transfer.dart';
import 'chat_screen.dart';

class FileTransferScreen extends StatelessWidget {
  const FileTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final files = [
      FileTransfer(
        id: '1',
        name: 'tour_map.pdf',
        size: '2.4 MB',
        type: 'received',
        status: 'completed',
        progress: 100,
      ),
      FileTransfer(
        id: '2',
        name: 'group_photo.jpg',
        size: '1.8 MB',
        type: 'sent',
        status: 'completed',
        progress: 100,
      ),
      FileTransfer(
        id: '3',
        name: 'audio_guide.mp3',
        size: '5.2 MB',
        type: 'received',
        status: 'pending',
        progress: 45,
      ),
      FileTransfer(
        id: '4',
        name: 'schedule.pdf',
        size: '890 KB',
        type: 'sent',
        status: 'failed',
        progress: 0,
      ),
    ];

    Color getStatusColor(String status) {
      switch (status) {
        case 'completed':
          return Colors.green;
        case 'failed':
          return Colors.red;
        case 'pending':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }

    IconData getTypeIcon(String type) {
      return type == 'received' ? Icons.download_rounded : Icons.upload_rounded;
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: 'File Transfers',
        avatarText: 'F',
        onCallPressed: () {}, // No call button here; leave empty or remove
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.blue),
            onPressed: () {
              // Implement add file action
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[50],
                  child: Icon(getTypeIcon(file.type), color: Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${file.size} • ${file.type.toUpperCase()}',
                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      if (file.status == 'pending')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LinearProgressIndicator(
                              value: file.progress / 100,
                              backgroundColor: Colors.grey[300],
                              valueColor:
                              const AlwaysStoppedAnimation(Colors.blue),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${file.progress}% complete',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        )
                      else
                        Text(
                          file.status.toUpperCase(),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: getStatusColor(file.status),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                if (file.status == 'completed')
                  const Icon(Icons.check_circle, color: Colors.green)
                else if (file.status == 'failed')
                  const Icon(Icons.error_outline, color: Colors.red)
                else if (file.status == 'pending' && file.type == 'received')
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, size: 20),
                          onPressed: () {
                            // Cancel action
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.check, size: 20),
                          onPressed: () {
                            // Accept action
                          },
                        ),
                      ],
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
