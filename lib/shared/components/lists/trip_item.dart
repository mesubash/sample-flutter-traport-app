import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TripItem extends StatelessWidget {
  final String date;
  final String from;
  final String to;
  final double fare;
  final String status;

  const TripItem({
    super.key,
    required this.date,
    required this.from,
    required this.to,
    required this.fare,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == 'completed';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Chip(
                  label: Text(
                    isCompleted ? 'completed'.tr() : 'cancelled'.tr(),
                    style: TextStyle(
                      color: isCompleted ? Colors.green : Colors.red,
                    ),
                  ),
                  backgroundColor: isCompleted
                      ? Colors.green.withOpacity(0.1)
                      : Colors.red.withOpacity(0.1),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.radio_button_checked,
                    size: 16, color: Colors.green),
                const SizedBox(width: 8),
                Text(from),
                const Spacer(),
                const Icon(Icons.arrow_forward),
                const Spacer(),
                const Icon(Icons.radio_button_checked,
                    size: 16, color: Colors.red),
                const SizedBox(width: 8),
                Text(to),
              ],
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.grey.shade300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'fare'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'NPR ${fare.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
