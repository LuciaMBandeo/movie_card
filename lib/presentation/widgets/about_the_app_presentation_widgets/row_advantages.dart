import 'package:flutter/material.dart';

class RowAdvantages extends StatelessWidget {
  const RowAdvantages({
    super.key,
    required this.numberAdvantage,
    required this.textAdvantage,
  });

  final String numberAdvantage;
  final String textAdvantage;
  static const double _numberSize = 50;
  static const double _rowPadding = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        _rowPadding,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: _rowPadding,
            ),
            child: Text(
              numberAdvantage,
              style: const TextStyle(
                fontSize: _numberSize,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              textAdvantage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
