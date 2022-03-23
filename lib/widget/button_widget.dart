part of 'widgets.dart';

class ButtonWidget extends StatelessWidget {
  Function()? onPressed;
  String? title;
  Color? firstColor;
  double? fontSize;
  Color? secondColor;
  FontWeight? fontWeight;
  Color? thirdColor;
  ButtonWidget(
      {Key? key,
      this.onPressed,
      this.title,
      this.firstColor,
      this.secondColor,
      this.fontSize,
      this.fontWeight,
      this.thirdColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
              color: firstColor != null ? firstColor! : Colors.transparent)),
      color: secondColor != null ? secondColor : Colors.red,
      minWidth: 100.w,
      height: 7.h,
      child: Text(title!, style: getStyles(fontSize, fontWeight, thirdColor)),
    );
  }
}
