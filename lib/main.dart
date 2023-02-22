import 'package:flutter/material.dart';

import 'screens/tahmin.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug yazısını kaldırır
      home: const Home(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Anasayfa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Tahmin Oyunu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/tahminzar.png"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Tahmin()));
                },
                child: const Text(
                  "Oyuna Başla",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
