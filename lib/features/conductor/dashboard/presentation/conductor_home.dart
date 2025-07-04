import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../shared/components/cards/status_card.dart';

class ConductorHome extends ConsumerWidget {
  const ConductorHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('conductor_dashboard'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.login),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StatusCard(
              title: 'active_passengers'.tr(),
              count: 12,
              icon: Icons.people,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            StatusCard(
              title: 'today_earnings'.tr(),
              count: 3250,
              icon: Icons.attach_money,
              color: Colors.blue,
              isMoney: true,
            ),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.qr_code_scanner,
                  label: 'scan_qr'.tr(),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.scanner),
                ),
                _buildActionButton(
                  context,
                  icon: Icons.receipt,
                  label: 'trip_summary'.tr(),
                  onTap: () {},
                ),
                _buildActionButton(
                  context,
                  icon: Icons.history,
                  label: 'past_trips'.tr(),
                  onTap: () {},
                ),
                _buildActionButton(
                  context,
                  icon: Icons.settings,
                  label: 'settings'.tr(),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(label, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
