class Wallet {
  String? message;
  String? walletId;
  String? userBalance;
  List<Data>? data;

  Wallet({this.message, this.walletId, this.userBalance, this.data});

  Wallet.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    walletId = json['wallet_id'];
    userBalance = json['user_balance'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['wallet_id'] = this.walletId;
    data['user_balance'] = this.userBalance;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? currencyName;
  String? cotation;
  String? symbol;
  String? imageUrl;
  Details? details;

  Data(
      {this.currencyName,
      this.cotation,
      this.symbol,
      this.imageUrl,
      this.details});

  Data.fromJson(Map<String, dynamic> json) {
    currencyName = json['currency_name'];
    cotation = json['cotation'];
    symbol = json['symbol'];
    imageUrl = json['image_url'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_name'] = this.currencyName;
    data['cotation'] = this.cotation;
    data['symbol'] = this.symbol;
    data['image_url'] = this.imageUrl;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? about;
  double? fee;

  Details({this.about, this.fee});

  Details.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['fee'] = this.fee;
    return data;
  }
}
