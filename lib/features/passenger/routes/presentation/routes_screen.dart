import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutesScreen extends ConsumerWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockRoutes = [
      {
        'name': 'Kirtipur - Ratnapark',
        'stops': ['Kirtipur', 'Chakrapath', 'Kalanki', 'Ratnapark'],
        'fare': 25.0,
        'duration': '45 min',
      },
      {
        'name': 'New Baneshwor - Gongabu',
        'stops': ['New Baneshwor', 'Koteshwor', 'Gaushala', 'Gongabu'],
        'fare': 30.0,
        'duration': '60 min',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('bus_routes'.tr()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockRoutes.length,
        itemBuilder: (context, index) {
          final route = mockRoutes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    route['name'] as String,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${'fare'.tr()}: NPR ${route['fare']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${'duration'.tr()}: ${route['duration']}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'stops'.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  ...(route['stops'] as List<String>).map((stop) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.fiber_manual_record, size: 8),
                          const SizedBox(width: 8),
                          Text(stop),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
