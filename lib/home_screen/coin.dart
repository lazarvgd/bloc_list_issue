import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  String name;
  bool isFavorite;

  Coin(this.name, this.isFavorite);

  @override
  // TODO: implement props
  List<Object?> get props => [name, isFavorite];
}