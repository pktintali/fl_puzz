import 'package:fl_puzz/components/grid_element.dart';
import 'package:fl_puzz/providers/game_provider.dart';
import 'package:fl_puzz/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (c, eP, _) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF012345),
          floatingActionButton: DropdownButton<int>(
            hint: const Text('Size'),
            iconEnabledColor: Colors.white,
            dropdownColor: Colors.brown.shade800,
            style: const TextStyle(color: Colors.white),
            value: eP.size,
            items: const [
              DropdownMenuItem(
                child: Text('3x3'),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text('4x4'),
                value: 4,
              ),
              DropdownMenuItem(
                child: Text('5x5'),
                value: 5,
              ),
              DropdownMenuItem(
                child: Text('6x6'),
                value: 6,
              ),
            ],
            onChanged: (v) async {
              if (!Utils.isMobile(context)) {
                eP.setPadding(10);
                await Future.delayed(const Duration(milliseconds: 400));
              }
              eP.setRotation(5);
              eP.refreshGame(eP.size);
      
              await Future.delayed(const Duration(milliseconds: 400), () {
                eP.resetPadding();
                eP.setSize(v!);
                eP.resetRotation();
              });
            },
          ),
          // backgroundColor: const Color(0xFF012345),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        mini: true,
                        child: const Icon(Icons.arrow_back),
                        backgroundColor: Colors.deepPurpleAccent.shade700,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(),
                  ],
                ),
                if (eP.isCompleted)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Wahoooo You did it in ${eP.steps} moves 🎉',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                const SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Restart'),
                    ),
                    onPressed: () async {
                      if (!Utils.isMobile(context)) {
                        eP.setPadding(10);
                        await Future.delayed(const Duration(milliseconds: 400));
                      }
                      eP.setRotation(5);
                      eP.refreshGame(eP.size);
                      await Future.delayed(const Duration(milliseconds: 400), () {
                        eP.resetPadding();
                        eP.resetRotation();
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: eP.isCompleted ? 15 : 50),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 800),
                  turns: eP.rotation,
                  curve: Curves.easeInOutSine,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: eP
                          .getSizedList()
                          .map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: eP
                                  .getSizedList()
                                  .map((i) => GridElement(x: e, y: i))
                                  .toList(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
