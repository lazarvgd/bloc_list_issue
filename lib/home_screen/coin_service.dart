import 'package:coins/home_screen/coin.dart';

class CoinService {
  final List<Coin> coins = _generateCoins();

  static List<Coin> _generateCoins() {
    return [
      const Coin('Bitcoin', false),
      const Coin('Ethereum', false),
      const Coin('Cardano', false),
      const Coin('Tether', false),
      const Coin('Binance Coin', false),
      const Coin('XRP', false),
      const Coin('Solana', false),
      const Coin('Polkadot', false),
      const Coin('USD Coin', false),
      const Coin('Dogecoin', false),
    ];
  }

  void clearCoins() {
    coins.clear();
    coins.addAll(_generateCoins());
  }
}
