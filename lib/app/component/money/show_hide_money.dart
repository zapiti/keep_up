import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_up/app/app_bloc.dart';

class ShowHideMoney extends StatefulWidget {
  double money;
  TextStyle textStyle;

  ShowHideMoney(this.money, this.textStyle);

  @override
  _ShowHideMoneyState createState() => _ShowHideMoneyState();
}

class _ShowHideMoneyState extends State<ShowHideMoney> {
  var appBloc = Modular.get<AppBloc>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: true,stream: appBloc.hideShowMoney,
      builder: (context, snapshot) => Container(
        child: (snapshot.data ?? true)
            ? Text(
                MoneyMaskedTextController(
                        initialValue: widget.money, leftSymbol: "R\$")
                    .text,
                style: widget.textStyle,
              )
            : Text(
                "R\$ ----",
                style: widget.textStyle,
              ),
      ),
    );
  }
}
