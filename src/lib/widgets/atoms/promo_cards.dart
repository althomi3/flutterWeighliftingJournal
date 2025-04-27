import 'package:flutter/material.dart';
import '../../custom_styles.dart';

class PromoCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const PromoCardWidget({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Style.widthPromoCard,
      child: Card(
        color: Style.colorFillTertiary,
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
