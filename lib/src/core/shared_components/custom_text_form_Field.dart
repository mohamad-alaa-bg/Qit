import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChange;

  // ignore: use_key_in_widget_constructors
  const CustomTextFormField({
    required this.textEditingController,
    required this.label,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onSubmitted,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    String str = "";
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        onChanged: onChange,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            label: Text(
              label,
              style: const TextStyle(
                  color: Color.fromRGBO(26, 26, 26, 0.56), fontSize: 16),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(26)),
            counterStyle: Theme.of(context).textTheme.bodyText2,
            contentPadding: const EdgeInsetsDirectional.only(start: 26)),
      ),
    );
  }
}
