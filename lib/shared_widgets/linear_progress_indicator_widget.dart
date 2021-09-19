import 'package:flutter/material.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  const LinearProgressIndicatorWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(height: 5),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation<Color>(AppTheme.colors.primary)
      ),
    ),
    SizedBox(height: 14)]);
  }
}