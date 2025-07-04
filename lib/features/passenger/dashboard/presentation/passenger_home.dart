import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/routes.dart';
import '../../../../shared/components/cards/balance_card.dart';
import '../../../../shared/components/cards/quick_action_card.dart';

class PassengerHome extends ConsumerWidget {
  const PassengerHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr()),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const BalanceCard(balance: 250.0),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                QuickActionCard(
                  icon: Icons.directions_bus,
                  label: 'tap_in'.tr(),
                  onTap: () => _showTapInDialog(context),
                  color: Colors.green,
                ),
                QuickActionCard(
                  icon: Icons.account_balance_wallet,
                  label: 'wallet'.tr(),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.wallet),
                  color: Colors.blue,
                ),
                QuickActionCard(
                  icon: Icons.history,
                  label: 'trips'.tr(),
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.tripHistory),
                  color: Colors.orange,
                ),
                QuickActionCard(
                  icon: Icons.map,
                  label: 'routes'.tr(),
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.routeList),
                  color: Colors.purple,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildRecentTripsSection(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.credit_card),
            label: 'wallet'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'profile'.tr(),
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, AppRoutes.wallet);
          if (index == 2) Navigator.pushNamed(context, AppRoutes.profile);
        },
      ),
    );
  }

  Widget _buildRecentTripsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'recent_trips'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) => const Divider(height: 16),
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.directions_bus, color: Colors.green),
            title: Text(
              'Trip to ${['Ratnapark', 'New Baneshwor', 'Kirtipur'][index]}',
            ),
            subtitle: Text(
              '2023-06-${15 + index} • NPR ${[25, 30, 20][index]}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  void _showTapInDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('select_tap_method'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: Text('scan_qr_code'.tr()),
              onTap: () {
                Navigator.pop(context);
                _startQrScan(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.nfc),
              title: Text('use_nfc_card'.tr()),
              onTap: () {
                Navigator.pop(context);
                _startNfcScan(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _startQrScan(BuildContext context) {
    // Implement QR scanning
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('qr_scan_started'.tr())));
  }

  void _startNfcScan(BuildContext context) {
    // Implement NFC scanning
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('nfc_scan_started'.tr())));
  }
}
