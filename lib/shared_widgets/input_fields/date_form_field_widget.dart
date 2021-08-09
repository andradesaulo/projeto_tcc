import 'package:flutter/material.dart';
import 'package:projeto_tcc/services/date_text_formatter.dart';
import 'package:projeto_tcc/shared_widgets/icon_widget.dart';
import 'package:projeto_tcc/shared_widgets/input_fields/text_form_field_widget.dart';

class DateFormFieldWidget extends StatelessWidget {
  final Function(String?)? onSaved;
  final Function(String)? onFieldSubmitted;
  final Function(String, TextEditingController?)? onChanged;
  final bool hasIcon;
  final TextInputAction? inputAction;
  const DateFormFieldWidget({
    Key? key,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.hasIcon = false,
    this.inputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldInputWidget(
      validator: (date) {
        if(date != null && date.isNotEmpty) {
          late int day;
          late int month;
          late int year;
          late DateTime fullDate;
          final List<String> dayMonthYear = date.split("/");
          
          if(dayMonthYear.length >= 1){
            day = int.parse(dayMonthYear[0]);
            if (day > 31) {
              return "Insira um dia válido";
            }
          } 

          if(dayMonthYear.length >= 2) {
            day = int.parse(dayMonthYear[0]);
            month = int.parse(dayMonthYear[1]);
            if (month > 12) {
              return "Insira um mês válido";
            }
          } 

          if (dayMonthYear.length == 3) {
              day = int.parse(dayMonthYear[0]);
              month = int.parse(dayMonthYear[1]);
              year = int.parse(dayMonthYear[2]);
              fullDate = DateTime(year, month, day);
              if (month == fullDate.month) {
                if (fullDate.isBefore(DateTime.now()
                                        .subtract(Duration(days: 47450)))) {
                  return "Insira um ano válido";
                }
              } else {
                return "Insira um dia válido";
              }
            }

            if (date.length < 10) {
              return "Insira uma data completa";
            }
        }
        return null;
      },
      label: "Data de nascimento",
      keyboardType: TextInputType.number,
      icon: IconWidget(name: Icons.event),
      inputFormatters: [DateTextFormatter()],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hasIcon: hasIcon,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
    );
  }
}
