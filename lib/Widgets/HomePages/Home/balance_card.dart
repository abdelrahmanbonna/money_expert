import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double balance;
  const BalanceCard({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.size.width,
      height: mediaQuery.size.height * 0.15,
      margin: EdgeInsets.symmetric(
        horizontal: mediaQuery.size.width * 0.0427,
        vertical: mediaQuery.size.height * 0.01,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            blurRadius: 15,
            offset: const Offset(2.5, 2.5),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 15,
            offset: const Offset(-2.5, -2.5),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: const [
          //TODO add cash balance and bank balance
        ],
      ),
    );
  }
}
