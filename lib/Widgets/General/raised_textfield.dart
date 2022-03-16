import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expert/extensions/extensions.dart';

class RaisedTextField extends StatelessWidget {
  final String? initialValue, hint, obscureText;
  final TextEditingController? controller;
  final void Function()? onEditingFinished;
  final void Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final bool obscure;
  final IconData? icon;
  final Widget? trellingWidget;

  const RaisedTextField({
    Key? key,
    this.initialValue,
    this.hint,
    this.controller,
    this.onEditingFinished,
    this.onChanged,
    this.onValidate,
    this.obscure = false,
    this.obscureText,
    this.icon,
    this.trellingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(
        microseconds: 400,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            blurRadius: 15,
            offset: const Offset(4, 4),
            spreadRadius: 1,
          ),
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 15,
            offset: const Offset(-4, -4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        onEditingComplete: onEditingFinished,
        onChanged: onChanged,
        validator: onValidate,
        textAlign: TextAlign.center,
        obscureText: obscure,
        obscuringCharacter: obscureText ?? 'X',
        decoration: InputDecoration(
          icon: icon != null
              ? Icon(
                  icon,
                  size: 23,
                  color: theme.primaryColor,
                ).setOnlyPadding(context, 0, 0, 0.0427, 0.0427)
              : null,
          suffixIcon: trellingWidget,
          border: InputBorder.none,
          hintStyle: GoogleFonts.ubuntu(
            color: theme.primaryColor,
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
