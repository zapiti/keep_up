import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/component/appbar/date_app_bar_custtom.dart';
import 'package:keep_up/app/component/title_description/title_description_value_circle.dart';
import 'package:keep_up/app/component/title_description/title_description_value_click.dart';
import 'package:keep_up/app/image/image_logo_widget.dart';
import 'package:keep_up/app/image/image_path.dart';
import 'package:keep_up/app/modules/home/modules/init/init_bloc.dart';
import 'package:keep_up/app/modules/home/modules/init/widget/mobile/progress/progress_widget.dart';
import 'package:keep_up/app/routes/constants_routes.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../app_bloc.dart';
import '../../../../home_bloc.dart';
import 'card/card_pages_list_widget.dart';
import 'menus/menus_pages_list_widget.dart';

class InitMobilePage extends StatefulWidget {
  @override
  _InitMobilePageState createState() => _InitMobilePageState();
}

class _InitMobilePageState extends State<InitMobilePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DateAppBarCustom(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 230.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppThemeUtils.colorsGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: CircularPercentIndicator(
                              radius: 160.0,
                              animation: true,
                              startAngle: 180,
                              animationDuration: 1200,
                              lineWidth: 15.0,
                              percent: 0.9,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Text(
                                    "361",
                                    style: AppThemeUtils.normalBoldSize(
                                        fontSize: 18),
                                  ),
                                  new Text(
                                    "Cal",
                                    style:
                                        AppThemeUtils.normalSize(fontSize: 14),
                                  ),
                                ],
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: AppThemeUtils.colorPrimary40,
                              progressColor: AppThemeUtils.colorPrimary,
                            )),
                        Column(
                          children: [
                            SizedBox(
                              height: 56,
                            ),
                            titleDescriptionValueCircle("Carb", "40g"),
                            titleDescriptionValueCircle("Prot", "30g"),
                            titleDescriptionValueCircle("Gord", "20g")
                          ],
                        )
                      ]),    Container(
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child:titleDescriptionValueCircle("Total Cal","1446",color: AppThemeUtils.colorSecundary))
                    ],
                  ),
                ),ProgressWidget(),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppThemeUtils.colorsGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 0.1,
                      ),
                    ],
                    borderRadius: BorderRadius.all( Radius.circular(20.0),
                    ),
                  ),
                  child:Column(children: [
                    titleDescriptionValueClick("Café da manhã",ImagePath.imageBreakFast,action: (){}),
                    titleDescriptionValueClick("Almoço",ImagePath.imageLunch,action: (){}),
                    titleDescriptionValueClick("Lanche",ImagePath.imageSnack,action: (){}),
                    titleDescriptionValueClick("Jantar",ImagePath.imageDinner,action: (){}),
                    titleDescriptionValueClick("Ceia",ImagePath.imageSupper,action: (){},disableLine:true),

                  ],))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
