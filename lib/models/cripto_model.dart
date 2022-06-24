import 'detail_model.dart';

class Data {
  String currencyName;
  String cotation;
  String symbol;
  String imageUrl;
  Details details;

  Data(
      {required this.currencyName,
      required this.cotation,
      required this.symbol,
      required this.imageUrl,
      required this.details});

  static Data fromJson(json) => Data(
        currencyName: json['currency_name'],
        cotation: json['cotation'],
        symbol: json['symbol'],
        imageUrl: json['image_url'],
        details: json['details'],
      );
}
