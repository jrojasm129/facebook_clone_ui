import 'package:flutter/material.dart';

import '../config/palette.dart';

class FacebookLogo extends StatelessWidget {
  const FacebookLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('facebook',
        style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2
        ));
  }
}