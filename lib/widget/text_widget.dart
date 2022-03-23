part of 'widgets.dart';

class TextFormWidget extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffixIcon;
  bool? enabled = true;
  TextFormWidget(
      {Key? key,
      this.hintText,
      this.prefix,
      this.enabled,
      this.suffixIcon,
      this.controller,
      this.obscureText,
      this.validator,
      this.keyboardType,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.black,
            width: 1.0,
          ),
        ),
      ),
      controller: controller,
      obscureText: obscureText!,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
