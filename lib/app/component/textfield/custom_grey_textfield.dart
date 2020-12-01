import 'package:flutter/material.dart';
import 'package:keep_up/app/utils/theme/app_theme_utils.dart';

class CustomGreyTextField extends StatelessWidget {
  bool enabled;
  bool obscureText;
  TextEditingController controller;
  Widget prefixIcon;
  String labelText;
  TextInputType keyboardType;
  Widget suffixIcon;

  CustomGreyTextField({this.enabled, this.obscureText, this.controller,
      this.prefixIcon,  this.suffixIcon, this.labelText, this. keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            color: AppThemeUtils.colorsGrey,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(18.0),
              ),
            ),
            child: TextField(
                enabled: enabled ??true,
                obscureText: obscureText ?? false,
                controller: controller,
                textAlign: TextAlign.start,keyboardType: keyboardType,
                decoration: InputDecoration(
                    labelText: labelText,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    border: const OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    )))));
  }
}
