import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../utils.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (c, eP, _) {
        return SizedBox(
          height: Utils.isMobile(context)
              ? Utils.getMobileBoxSize(eP.size)
              : Utils.getBoxSize(eP.size),
          width: Utils.isMobile(context)
              ? Utils.getMobileBoxSize(eP.size)
              : Utils.getBoxSize(eP.size),
        );
      },
    );
  }
}
