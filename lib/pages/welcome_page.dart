import 'package:fl_puzz/pages/home_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade700,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.videogame_asset_rounded,
              size: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Start Game'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Settings'),
            ),
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
