import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar loginAppBar() {
  return AppBar(
    centerTitle: true,
    title: SvgPicture.asset(
      "assets/images/Khusm.svg",
      width: 100,
      fit: BoxFit.fitWidth,
    ),
  );
}
