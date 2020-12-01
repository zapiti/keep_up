import 'package:flutter/material.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      decoration: BoxDecoration(
          color: AppThemeUtils.colorSecundary40,
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding:
                EdgeInsets.only(right: 10.0, left: 10.0, bottom: 0, top: 10),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              leading: new  Padding(
                padding:
                EdgeInsets.only(right: 10.0, left: 10.0),
                child:Text("Meta",style: AppThemeUtils.normalSize(),)),
              trailing: new Padding(
                padding:
                EdgeInsets.only(right: 10.0, left: 10.0),
                child:Text("69kg",style: AppThemeUtils.normalSize(),)),
              percent: 0.2,
              center: Text(
                "",
                style: AppThemeUtils.normalSize(fontSize: 12),
              ),backgroundColor: AppThemeUtils.whiteColor,
              progressColor: AppThemeUtils.colorSecundary80,
            ),
          ), Container(width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 35.0, top: 2,right: 56,bottom: 3),
              child: Text(
                "Falta 347 g",textAlign: TextAlign.right,
                style: AppThemeUtils.smallSize(fontSize: 10),
              )),
        ],
      ),
    );
  }
}
