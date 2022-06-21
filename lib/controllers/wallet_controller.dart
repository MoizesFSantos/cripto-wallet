import 'package:criptowallet/models/wallet_model.dart';
import 'package:criptowallet/repositories/repository.dart';

class WalletController {
  final Repository _repository;

  WalletController(this._repository);

  Future<List<Wallet>> fetchWallet() async {
    return _repository.getWallet();
  }
}
