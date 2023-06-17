import 'package:freezed_annotation/freezed_annotation.dart';
part 'coin.freezed.dart';
@freezed
class Coin with _$Coin {
  const factory Coin(String name, bool isFavorite) = _Coin;
}
