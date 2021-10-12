import 'package:flutter/material.dart';

import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/theme/app_list_tile_colors.dart';
import 'package:projeto_tcc/theme/app_theme.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final int colorId;
  final String? iconUrl;
  final Function()? onTap;

  const ListTileWidget({
    Key? key,
    required this.title,
    this.subtitle,
    required this.colorId,
    this.iconUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        child: Center(
                          child: 
                            iconUrl != null 
                            ? Image.asset(
                                "assets/images/${iconUrl!}",
                                width: 40,) 
                            : null,
                        ),
                        width: 100, 
                        height: 72, 
                        color: AppListTileColors.getColor(colorId)
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title, 
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.colors.listTileTitle
                          )
                        ),
                        SizedBox(height: 5),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.colors.listTileSubtitle
                          )
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconWidget(
                    name: Icons.arrow_right_alt,
                    color: AppTheme.colors.listTileArrow,
                  ),
                )
              ]
            ),
          ),
      ),
      );
  }
}
