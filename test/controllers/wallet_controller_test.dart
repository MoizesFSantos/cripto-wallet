import 'package:criptowallet/models/wallet_model.dart';
import 'package:criptowallet/repositories/repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = Repository();
  test('deve retornar a wallet', () {
    Future<List<Wallet>> fetchWallet() async {
      final test = await repository.getWallet();
      return test;
    }
  });
}
