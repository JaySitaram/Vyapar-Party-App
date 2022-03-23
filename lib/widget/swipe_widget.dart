import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:slider_button/slider_button.dart';
import 'package:vyapar_party_app/utils/utils.dart';

class SwipeWidget extends StatelessWidget {
  String? title;
  Icon? icon;
  Function? actionFunction;
  SwipeWidget({Key? key, this.title, this.icon, this.actionFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SliderButton(
      width: 100.w,
      action: actionFunction!,
      backgroundColor: AppColors.greenAccent,
      label: Text(
        title!,
        style: TextStyle(
            color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 17),
      ),
      icon: icon,
    ));
  }
}
