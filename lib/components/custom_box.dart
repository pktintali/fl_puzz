import 'package:flutter/material.dart';

import '../utils.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Utils.isMobile(context) ? 50 : 100,
      width: Utils.isMobile(context) ? 50 : 100,
    );
  }
}
