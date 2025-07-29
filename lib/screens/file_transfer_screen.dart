import 'package:flutter/material.dart';
import '../models/file_transfer.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('File Transfer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: files.length,
        itemBuilder: (context, index) {
          final file = files[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.folder, color: Colors.grey),
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              file.size,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(' • ', style: TextStyle(color: Colors.grey)),
                            Text(
                              file.type.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              file.type == 'received' ? Icons.download : Icons.upload,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        if (file.status == 'pending') ...[
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: file.progress / 100,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${file.progress}% complete',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  if (file.status == 'completed')
                    const Icon(Icons.check_circle, color: Colors.green)
                  else if (file.status == 'failed')
                    const Icon(Icons.error, color: Colors.red)
                  else if (file.status == 'pending' && file.type == 'received')
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.check, size: 20),
                            onPressed: () {},
                          ),
                        ],
                      ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
