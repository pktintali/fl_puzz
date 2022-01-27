import 'package:fl_puzz/components/grid_element.dart';
import 'package:fl_puzz/providers/element_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Center(
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Restart'),
                ),
                onPressed: () {
                  Provider.of<ElementProvider>(context, listen: false)
                      .refreshGame();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width<400?400:500,
                width: 500,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  children: const [
                    GridElement(x: 0, y: 0),
                    GridElement(x: 0, y: 1),
                    GridElement(x: 0, y: 2),
                    GridElement(x: 0, y: 3),
                    GridElement(x: 1, y: 0),
                    GridElement(x: 1, y: 1),
                    GridElement(x: 1, y: 2),
                    GridElement(x: 1, y: 3),
                    GridElement(x: 2, y: 0),
                    GridElement(x: 2, y: 1),
                    GridElement(x: 2, y: 2),
                    GridElement(x: 2, y: 3),
                    GridElement(x: 3, y: 0),
                    GridElement(x: 3, y: 1),
                    GridElement(x: 3, y: 2),
                    GridElement(x: 3, y: 3),
                  ],
                ),
              ),
            ),
            Consumer<ElementProvider>(builder: (c, eP, child) {
              if (eP.isCompleted) {
                return Text(
                  'Wahoooo You did it in ${eP.steps} steps⚜',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
