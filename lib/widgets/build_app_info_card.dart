import 'package:flutter/material.dart';

import 'build_info_row.dart';

Widget buildAppInfoCard() {
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
              Icon(Icons.info_outline, color: Colors.grey, size: 28),
              SizedBox(width: 16),
              Text(
                'App Information',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 16),
          buildInfoRow('Version', '1.0.0'),
          buildInfoRow('Build', '2024.01.15'),
        ],
      ),
    ),
  );
}
