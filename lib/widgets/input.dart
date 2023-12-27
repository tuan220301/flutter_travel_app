import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Function? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;
  const Input({
    super.key,
    this.placeholder = '',
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.autofocus = false,
    this.borderColor = NowUIColors.border,
    this.controller,
    // this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: NowUIColors.muted,
        onTap: onTap as void Function()?,
        onChanged: onChanged as void Function(String)?,
        controller: controller,
        autofocus: autofocus,
        style: const TextStyle(
            height: 0.55, fontSize: 13.0, color: NowUIColors.time),
        textAlignVertical: const TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
            filled: true,
            fillColor: NowUIColors.white,
            hintStyle: const TextStyle(
              color: NowUIColors.time,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}
