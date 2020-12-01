import 'package:flutter/material.dart';
import 'package:keep_up/app/component/money/show_hide_money.dart';
import 'package:keep_up/app/component/simple/line_view_widget.dart';
import 'package:keep_up/app/component/money/show_hide_buttom.dart';

import 'package:keep_up/app/modules/home/modules/init/model/card_item.dart';
import 'package:keep_up/app/utils/string/string_file.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

class CardItemWidget extends StatelessWidget {
  CardItem cardItem;

  CardItemWidget(this.cardItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(cardItem.nameCard,
                  style: AppThemeUtils.normalBoldSize(
                      fontSize: 16, color: AppThemeUtils.colorPrimary))),
          lineViewWidget(),
          Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.monetization_on_outlined),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(StringFile.saldoDisponivel,
                        style: AppThemeUtils.normalSize(fontSize: 16)),
                  )
                ],
              )),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 20),
                child: ShowHideMoney(cardItem.cardValue,
                    AppThemeUtils.normalBoldSize(fontSize: 24)),
              )),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ShowHideButtom(
                  size: 24,
                ),
              )
            ],
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 0, left: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Text(StringFile.reembolsoSolicitado,
                            style: AppThemeUtils.normalSize(fontSize: 16)),
                      ),
                      Container(
                        child: ShowHideMoney(cardItem.cardSolicitation,
                            AppThemeUtils.normalSize(fontSize: 16)),
                      )
                    ],
                  ))),
          lineViewWidget(top: 10),
          FlatButton(
            onPressed: () {},
            child: Text(StringFile.scanCard,
                style: AppThemeUtils.normalSize(
                    fontSize: 16, color: AppThemeUtils.colorPrimary)),
          ),
        ],
      ),
    );
  }
}
