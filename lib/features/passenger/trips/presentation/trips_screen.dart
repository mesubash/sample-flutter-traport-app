import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/components/lists/trip_item.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockTrips = List.generate(10, (index) {
      return {
        'date': '2023-06-${15 + index}',
        'from': ['Kirtipur', 'New Baneshwor', 'Ratnapark'][index % 3],
        'to': ['Ratnapark', 'Gongabu', 'Kirtipur'][index % 3],
        'fare': [25.0, 30.0, 20.0][index % 3],
        'status': ['completed', 'cancelled', 'completed'][index % 3],
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('trip_history'.tr()),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mockTrips.length,
        separatorBuilder: (context, index) => const Divider(height: 16),
        itemBuilder: (context, index) {
          final trip = mockTrips[index];
          return TripItem(
            date: trip['date'] as String,
            from: trip['from'] as String,
            to: trip['to'] as String,
            fare: trip['fare'] as double,
            status: trip['status'] as String,
          );
        },
      ),
    );
  }
}
