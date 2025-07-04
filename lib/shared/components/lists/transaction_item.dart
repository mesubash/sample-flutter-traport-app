import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final String date;
  final IconData icon;
  final Color iconColor;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isCredit = amount > 0;

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title.tr()),
      subtitle: Text(date),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'NPR ${amount.abs().toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isCredit ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            isCredit ? 'credit'.tr() : 'debit'.tr(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isCredit ? Colors.green : Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
