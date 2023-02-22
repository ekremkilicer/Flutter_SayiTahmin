import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sayitahmin/screens/sonuc.dart';

class Tahmin extends StatefulWidget {
  const Tahmin({super.key});

  @override
  State<Tahmin> createState() => _TahminState();
}

class _TahminState extends State<Tahmin> {
  var tahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String orientation = "";
  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //   actions: [
        //   Icon(Icons.home)
        // ],
        title: const Text("Tahmin Etme Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hakkınız:$kalanHak",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
            Text(
              "İpucu:$orientation",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    labelText: "Tahmin",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        kalanHak = kalanHak - 1;
                      });
                      var tahminKontrol = int.parse(tahmin.text);
                      if (tahminKontrol == rastgeleSayi) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sonuc(sonuc: true)));
                      } else if (tahminKontrol > rastgeleSayi) {
                        setState(() {
                          orientation = "Tahmini Azalt";
                        });
                      } else if (tahminKontrol < rastgeleSayi) {
                        setState(() {
                          orientation = "Tahmini Arttır";
                        });
                      }
                      if (kalanHak == 0) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sonuc(sonuc: false)));
                      }
                      tahmin.text = "";
                    },
                    child: const Text("Tahmin Et")))
          ],
        ),
      ),
    );
  }
}
