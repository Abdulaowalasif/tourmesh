class FileTransfer {
  final String id;
  final String name;
  final String size;
  final String type; // 'sent' or 'received'
  final String status; // 'pending', 'completed', 'failed'
  final int progress;

  FileTransfer({
    required this.id,
    required this.name,
    required this.size,
    required this.type,
    required this.status,
    required this.progress,
  });
}
