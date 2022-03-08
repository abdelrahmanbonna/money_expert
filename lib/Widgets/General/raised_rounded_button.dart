import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RaisedRoundedButton extends StatelessWidget {
  final double? width;
  final String title;
  final Function()? onTap;
  const RaisedRoundedButton({
    Key? key,
    required this.title,
    this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? mediaQuery.size.width,
        height: mediaQuery.size.height * 0.065,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[600]!,
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
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textStyle: theme.textTheme.button,
            ),
          ),
        ),
      ),
    );
  }
}
