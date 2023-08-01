import 'package:flutter/cupertino.dart';


class CText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  final TextAlign? hasCenter;
  const CText({super.key, this.style,this.hasCenter, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: hasCenter,
      text,
      style: style??const TextStyle(

          fontSize: 15,
          fontFamily: "Poppins Regular",
          fontWeight: FontWeight.bold
      ),
    );
  }
}
