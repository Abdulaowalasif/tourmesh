class Message {
  final String id;
  final String text;
  final String sender;
  final String timestamp;
  final bool delivered;

  Message({
    required this.id,
    required this.text,
    required this.sender,
    required this.timestamp,
    this.delivered = false,
  });
}
