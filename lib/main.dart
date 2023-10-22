import 'package:doviz_kurlari/styles/color.dart';
import 'package:doviz_kurlari/styles/typo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic>? currencyData;

  @override
  void initState() {
    super.initState();
    fetchData();
    const Duration updateInterval = Duration(seconds: 10);
    Timer.periodic(updateInterval, (Timer t) {
      fetchData();
      print("10 saniyelik tekrarlama");
    });
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.genelpara.com/embed/doviz.json'));
    //Atın json kodu https://gist.github.com/berkocan/6da90f1aaa7b806317c99f9e636947bf
    if (response.statusCode == 200) {
      setState(() {
        currencyData = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("widget tekrarlama");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Güncel Döviz Kurları',
            style: header,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0))),
        ),
        body: currencyData == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildCurrencyCard('Dolar', currencyData?['USD'], 'us'),
                    buildCurrencyCard('Euro', currencyData?['EUR'], 'eu'),
                    buildCurrencyCard(
                        'Sterlin', currencyData?['GBP'], 'gb-eng'),
                    buildCurrencyCard('Altın', currencyData?['GA'], 'tr'),
                  ],
                ),
              ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget buildCurrencyCard(
      String currency, Map<String, dynamic>? data, String flag) {
    Widget cardContent;
    if (data == null) {
      cardContent = ListTile(
        title: Text(
          currency,
          style: header,
        ),
        subtitle: Text(
          'Fiyat: N/A',
          style: subheader,
        ),
      );
    } else {
      double degisim = double.parse(data['degisim']);
      double satis = double.parse(data['satis']);
      double onePercent = satis / 100;
      double percentageChange = satis - (onePercent * degisim);

      cardContent = ListTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Fiyat: $satis', style: price),
            Text('Değişim: $degisim',
                style: degisim < 0 ? smallGreen : smallRed),
            Text(
              'Önceki Değer: ${percentageChange.toStringAsFixed(2)}',
              style: small,
            ),
          ],
        ),
        leading: Container(
          height: 22,
          width: 22,
          child: SvgPicture.asset('lib/flags/svg/$flag.svg'),
        ),
      );
    }
    //child: SvgPicture.asset('lib/java/flags/svg/$flag.svg'),

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          border:
              Border.all(color: softWhite, width: 1)), // Add padding as needed

      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16),
        child: cardContent,
      ),
    );
  }
}
