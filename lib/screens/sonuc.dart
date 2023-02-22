import 'package:flutter/material.dart';

class Sonuc extends StatefulWidget {
  bool sonuc;
  Sonuc({super.key, required this.sonuc});

  @override
  State<Sonuc> createState() => _SonucState();
}

class _SonucState extends State<Sonuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuc Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc
                ? const Text("FENERBAHCE SAMPİYON",
                    style: TextStyle(color: Colors.blue, fontSize: 36))
                : const Text("KAYBETTİNİZ",
                    style: TextStyle(color: Colors.red, fontSize: 36)),
            widget.sonuc
                ? Image.asset("assets/images/mutlu.jpg")
                : Image.asset("assets/images/mutsuz.jpg"),
            const SizedBox(
              width: 200,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
