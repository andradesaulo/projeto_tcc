import 'package:flutter/material.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class PetAfericaoIndicatorWidget extends StatelessWidget {
  final String type;
  final String value;
  const PetAfericaoIndicatorWidget({
    Key? key,
    required this.type,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Text(value, style: TextStyle(fontSize: 50, color: type == "bpm" ?AppTheme.colors.indicatorBPM : AppTheme.colors.indicatorOX)),
            // SizedBox(height: 1,),
            if (type == "bpm") ...[
              IconWidget(name: Icons.favorite, color: AppTheme.colors.indicatorBPM),
            ] else ...[
              Text("Ox", style: TextStyle(fontSize: 25, color: AppTheme.colors.indicatorOX, fontWeight: FontWeight.bold),),
            ]
          ],
        ),
        Container(
          width: 150,
          height: 150,
          child:
          CircularProgressIndicator(
            value: 1,
            valueColor: AlwaysStoppedAnimation<Color>(type == "bpm" ? AppTheme.colors.indicatorBPM : AppTheme.colors.indicatorOX),
            strokeWidth: 10,
          )            
        )
      ],
    );
  }
}
