import 'package:flutter/material.dart';

class EncryptionCard extends StatefulWidget {
  final bool encryptionEnabled;

  const EncryptionCard({Key? key, required this.encryptionEnabled}) : super(key: key);

  @override
  _EncryptionCardState createState() => _EncryptionCardState();
}

class _EncryptionCardState extends State<EncryptionCard> {
  late bool _encryptionEnabled;

  @override
  void initState() {
    super.initState();
    _encryptionEnabled = widget.encryptionEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            const Icon(Icons.security, color: Colors.green, size: 28),
            const SizedBox(width: 20),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Encryption',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'End-to-end encryption for messages',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Switch(
              value: _encryptionEnabled,
              onChanged: (value) {
                setState(() {
                  _encryptionEnabled = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
