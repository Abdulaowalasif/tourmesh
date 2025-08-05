
import 'package:flutter/material.dart';

import 'build_storage_row.dart';

Widget buildStorageUsageCard() {
  return Material(
    elevation: 3,
    shadowColor: Colors.black.withOpacity(0.1),
    borderRadius: BorderRadius.circular(18),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.storage, color: Colors.green, size: 28),
              SizedBox(width: 16),
              Text(
                'Storage Usage',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildStorageRow('Messages', '2.4 MB'),
          buildStorageRow('Files', '15.7 MB'),
          buildStorageRow('Cache', '3.1 MB'),
          const Divider(height: 32, thickness: 1.2),

          buildStorageRow(
            'Total',
            '21.2 MB',
            isBold: true,
          ),
        ],
      ),
    ),
  );
}
