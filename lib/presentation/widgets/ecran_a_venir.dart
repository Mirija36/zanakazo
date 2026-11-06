import 'package:flutter/material.dart';

class EcranAVenir extends StatelessWidget {
  const EcranAVenir({super.key, required this.titre, required this.icone});
  final String titre;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(titre)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 48),
            const SizedBox(height: 12),
            Text('Bientôt', style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
