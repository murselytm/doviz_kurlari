class Moneys {
  final String value;

  Moneys._(this.value);

  static final all = Moneys._("TP.DK.USD.A-TP.DK.USD.S" +
      "-TP.DK.AUD.A-TP.DK.AUD.S" +
      "-TP.DK.DKK.A-TP.DK.DKK.S" +
      "-TP.DK.EUR.A-TP.DK.EUR.S" +
      "-TP.DK.GBP.A-TP.DK.GBP.S" +
      "-TP.DK.CHF.A-TP.DK.CHF.S" +
      "-TP.DK.SEK.A-TP.DK.SEK.S" +
      "-TP.DK.CAD.A-TP.DK.CAD.S" +
      "-TP.DK.KWD.A-TP.DK.KWD.S" +
      "-TP.DK.NOK.A-TP.DK.NOK.S" +
      "-TP.DK.SAR.A-TP.DK.SAR.S" +
      "-TP.DK.JPY.A-TP.DK.JPY.S" +
      "-TP.DK.BGN.A-TP.DK.BGN.S" +
      "-TP.DK.RON.A-TP.DK.RON.S" +
      "-TP.DK.RUB.A-TP.DK.RUB.S" +
      "-TP.DK.IRR.A-TP.DK.IRR.S" +
      "-TP.DK.CNY.A-TP.DK.CNY.S" +
      "-TP.DK.PKR.A-TP.DK.PKR.S" +
      "-TP.DK.QAR.A-TP.DK.QAR.S");

  static final usd = Moneys._("TP.DK.USD.A-TP.DK.USD.S");
  static final usd_buy = Moneys._("TP.DK.USD.A");
  static final usd_sell = Moneys._("TP.DK.USD.S");

  static final aud = Moneys._("TP.DK.AUD.A-TP.DK.AUD.S");
  static final audBuy = Moneys._("TP.DK.AUD.A");
  static final audSell = Moneys._("TP.DK.AUD.S");

  static final dkk = Moneys._("TP.DK.DKK.A-TP.DK.DKK.S");
  static final dkkBuy = Moneys._("TP.DK.DKK.A");
  static final dkkSell = Moneys._("TP.DK.DKK.S");

  // Define other currencies in a similar manner

  @override
  String toString() => value;
}

void main() {
  print(Moneys.all.toString());
  print(Moneys.usd.toString());
  print(Moneys.usd_buy.toString());
  print(Moneys.usd_sell.toString());
  print(Moneys.aud.toString());
  print(Moneys.audBuy.toString());
  print(Moneys.audSell.toString());
  print(Moneys.dkk.toString());
  print(Moneys.dkkBuy.toString());
  print(Moneys.dkkSell.toString());
}
