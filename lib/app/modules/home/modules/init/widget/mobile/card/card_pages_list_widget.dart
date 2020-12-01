import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/init/list_card_item.dart';


import '../../../../../../../app_bloc.dart';
import 'card_item_widget.dart';

class CardPagesListWidget extends StatelessWidget {
  bool smallSize;
  var appBloc = Modular.get<AppBloc>();

  CardPagesListWidget(this.smallSize);

  @override
  Widget build(BuildContext context) {
    return  Container(
            height: smallSize ? 40 : 200,
            child: PageView(
                children: _listFields(context),
                onPageChanged: (pos) {
                  appBloc.setPosition(pos);
                },
                controller: PageController(
                  viewportFraction: 0.9,
                  initialPage: appBloc.initialPosition.stream.value ?? 0,
                )));
  }
}

List<Widget> _listFields(BuildContext context) {
  return listCardItem.map<Widget>((e) => CardItemWidget(e)).toList();
}
