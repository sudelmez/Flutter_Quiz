import 'package:class_ex/veriler.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  testveri test_1 = testveri();

  // TestVeri test_1 = TestVeri();

  void butonFonk(bool secim) {
    if (test_1.testBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Test bitti."),
            //content: new Text("Alert Dialog body"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    secimler = [];
                    test_1.testiSifirla();
                  });
                },
                child: new Text("BAŞA DÖN"),
              ),
            ],
          );
        },
      );
    } else {
      bool dogruyanit = test_1.soruBankasi[test_1.soru].soruyaniti;

      setState(() {
        test_1.sonrakiSoru();
        if (dogruyanit == secim) {
          secimler.add(dogruIconu);
        } else {
          secimler.add(yanlisIconu);
        }
      });
    }
  }

  List<bool> yanitlar = [false, true, false, false, true, true, true];

  @override
  Widget build(BuildContext context) {
    /*if (sayi == 7) {
      //SystemNavigator.pop();
      setState(() => isButtonDisabled = true);
    }*/

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.soruBankasi[test_1.soru].sorumetni,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          runSpacing: 3, //dikeyde boşluk
          spacing: 3, //yataydaboşluk
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red[400]),
                            child: Icon(
                              Icons.thumb_down,
                              size: 30.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              butonFonk(false);
                            },
                          ),
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.green[400]),
                            child: Icon(Icons.thumb_up,
                                size: 30.0, color: Colors.white),
                            onPressed: () {
                              butonFonk(true);
                            },
                          ),
                        ))),
              ])),
        )
      ],
    );
  }
}
