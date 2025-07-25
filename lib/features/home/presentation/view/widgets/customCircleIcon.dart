import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Customcircleicon extends StatelessWidget {
  Customcircleicon({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[50],
      radius: 25,
      child: CircleAvatar(
        child: SvgPicture.asset('assets/images/home/person.svg'),
        radius: 18,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
