import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/app_bloc.dart';
import 'package:keep_up/app/component/dialog/dialog_date_time.dart';
import 'package:keep_up/app/component/dialog/dialog_generic_calendar.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

Widget selectDay({BuildContext context,String text,bool selected,DateTime dateTime}) {

  return  FlatButton(
      onPressed: () {
        showGenericDialogCalendar(context:context,selectedDay: dateTime);
    // DialogDateTime.selectDate(context,dateTime ?? DateTime.now()).then((value) {
    //   appBloc.dateSelected.sink.add(value);
    // });
  },
  child: Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(

      child: Center(child:    Text(
            text,textAlign: TextAlign.center,


            style: AppThemeUtils.normalBoldSize(
                color: selected ?AppThemeUtils.colorPrimary: AppThemeUtils.black,
                fontSize: 22),
          ))),
          Container(
            width: 60,
            height: 3,margin: EdgeInsets.only(top: 0),
            color:selected ?AppThemeUtils.colorPrimary: Colors.transparent,
          )
        ],
      )));
}