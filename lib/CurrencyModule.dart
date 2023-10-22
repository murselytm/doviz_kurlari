import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CurrencyModule {
  final String apiKey;
  String calculateStartDate(String endDate, int numberOfDays) {
    final endDateFormat = DateFormat('dd-MM-yyyy');
    final endDateParsed = endDateFormat.parse(endDate);
    final startDate = endDateParsed.subtract(Duration(days: numberOfDays));
    return endDateFormat.format(startDate);
  }
  CurrencyModule(this.apiKey);

  Future<List<Map<String, dynamic>>?> getAllDataGroups() async {
    final url = Uri.parse('https://evds2.tcmb.gov.tr/service/evds/datagroups?key=$apiKey&mode=0&type=json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody is List) {
          return responseBody.cast<Map<String, dynamic>>();
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  Future<List<Map<String, dynamic>>?> getDataGroupDetails(String dataGroupCode) async {
    final url = Uri.parse('https://evds2.tcmb.gov.tr/service/evds/datagroups?key=$apiKey&mode=2&code=$dataGroupCode&type=json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody is List) {
          return responseBody.cast<Map<String, dynamic>>();
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  Future<List<Map<String, dynamic>>?> getSeriesList(String dataGroupCode) async {
    final url = Uri.parse('https://evds2.tcmb.gov.tr/service/evds/serieList?key=$apiKey&type=json&code=$dataGroupCode');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody is List) {
          return responseBody.cast<Map<String, dynamic>>();
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  Future<List<Map<String, dynamic>>?> getCurrencyData(String dataGroupCode, String startDate, String endDate) async {
    final url = Uri.parse('https://evds2.tcmb.gov.tr/service/evds/datagroup=$dataGroupCode&startDate=$startDate&endDate=$endDate&type=json&key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody is List) {
          return responseBody.cast<Map<String, dynamic>>();
        }
      }else{
            print('HTTP Request Error: ${response.statusCode} - ${response.reasonPhrase}');

      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }

  String currentDateFormatted() {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(now);
  }
}


enum Moneys {
  ALL,
  USD,
  USD_BUY,
  USD_SELL,
  AUD,
  AUD_BUY,
  AUD_SELL,
  DKK,
  DKK_BUY,
  DKK_SELL,
  EUR,
  EUR_BUY,
  EUR_SELL,
  GBP,
  GBP_BUY,
  GBP_SELL,
  CHF,
  CHF_BUY,
  CHF_SELL,
  SEK,
  SEK_BUY,
  SEK_SELL,
  CAD,
  CAD_BUY,
  CAD_SELL,
  KWD,
  KWD_BUY,
  KWD_SELL,
  NOK,
  NOK_BUY,
  NOK_SELL,
  SAR,
  SAR_BUY,
  SAR_SELL,
  JPY,
  JPY_BUY,
  JPY_SELL,
  BGN,
  BGN_BUY,
  BGN_SELL,
  RON,
  RON_BUY,
  RON_SELL,
  RUB,
  RUB_BUY,
  RUB_SELL,
  IRR,
  IRR_BUY,
  IRR_SELL,
  CNY,
  CNY_BUY,
  CNY_SELL,
  PKR,
  PKR_BUY,
  PKR_SELL,
  QAR,
  QAR_BUY,
  QAR_SELL,
}
