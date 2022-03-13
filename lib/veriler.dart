import 'package:class_ex/soru.dart';

class testveri {
  int soru = 0;
  void sonrakiSoru() {
    if (soru + 1 < soruBankasi.length) {
      soru++;
    }
  }

  bool testBittiMi() {
    if (soru + 1 >= soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    soru = 0;
  }

  List<Soru> soruBankasi = [
    Soru(
        sorumetni: '1.Titanic gelmiş geçmiş en büyük gemidir',
        soruyaniti: false),
    Soru(
        sorumetni: '2.Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruyaniti: true),
    Soru(sorumetni: '3.Kelebeklerin ömrü bir gündür', soruyaniti: true),
    Soru(sorumetni: '4.Dünya düzdür', soruyaniti: false),
    Soru(
        sorumetni: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        soruyaniti: true),
    Soru(
        sorumetni: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        soruyaniti: true),
    Soru(sorumetni: '7.Fransızlar 80 demek için, 4 - 20 der', soruyaniti: true),
    Soru(
        sorumetni: 'Test bitti. Başa dönmek için tıklayınız.', soruyaniti: true)
  ];
}
