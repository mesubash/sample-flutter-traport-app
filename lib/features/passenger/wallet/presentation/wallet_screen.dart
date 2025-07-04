import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/components/buttons/primary_button.dart';
import '../../../../shared/components/cards/balance_card.dart';
import '../../../../shared/components/lists/transaction_item.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('wallet'.tr())),
      body: Column(
        children: [
          const BalanceCard(balance: 250.0, showActions: true),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(height: 16),
              itemBuilder: (context, index) => TransactionItem(
                amount: index % 2 == 0 ? 50.0 : -25.0,
                title: index % 2 == 0 ? 'Top Up' : 'Bus Fare',
                date: '2023-06-${10 + index}',
                icon: index % 2 == 0 ? Icons.add_circle : Icons.directions_bus,
                iconColor: index % 2 == 0 ? Colors.green : Colors.blue,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTopUpOptions(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showTopUpOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'select_topup_amount'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [100, 200, 500, 1000, 2000, 'other'].map((amount) {
                if (amount == 'other') {
                  return PrimaryButton(
                    text: 'other_amount'.tr(),
                    onPressed: () => _showCustomAmountDialog(context),
                    variant: ButtonVariant.outlined,
                  );
                }
                return PrimaryButton(
                  text: 'NPR $amount',
                  onPressed: () =>
                      _processTopUp(context, (amount as num).toDouble()),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showCustomAmountDialog(BuildContext context) {
    Navigator.pop(context); // Close bottom sheet
    showDialog(
      context: context,
      builder: (context) {
        final amountController = TextEditingController();
        return AlertDialog(
          title: Text('enter_amount'.tr()),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: 'NPR ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('cancel'.tr()),
            ),
            TextButton(
              onPressed: () {
                final amount = double.tryParse(amountController.text) ?? 0;
                if (amount > 0) {
                  _processTopUp(context, amount);
                }
                Navigator.pop(context);
              },
              child: Text('confirm'.tr()),
            ),
          ],
        );
      },
    );
  }

  void _processTopUp(BuildContext context, double amount) {
    // Mock top-up process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('topping_up'.tr(args: [amount.toString()]))),
    );

    // In a real app, this would open payment gateway
    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('topup_successful'.tr())));
    });
  }
}
