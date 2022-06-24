import 'cripto_model.dart';

class Wallet {
  String message;
  String walletId;
  String userBalance;
  List<Data> data;

  Wallet(
      {required this.message,
      required this.walletId,
      required this.userBalance,
      required this.data});

  Wallet fromJson(Map<String, dynamic> json) => Wallet(
      message: json['message'],
      walletId: json['wallet_id'],
      userBalance: json['user_balance'],
      data: json['data']);
}
