import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/home_screen/coin.dart';

part 'home_screen_bloc.freezed.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  List<Coin> coins = [
    Coin('Bitcoin', false),
    Coin('Ethereum', false),
    Coin('Cardano', false),
    Coin('Tether', false),
    Coin('Binance Coin', false),
    Coin('XRP', false),
    Coin('Solana', false),
    Coin('Polkadot', false),
    Coin('USD Coin', false),
    Coin('Dogecoin', false),
  ];

  HomeScreenBloc() : super(const HomeScreenState.initial()) {
    on<_Fetch>(_onStarted);
    on<_AddToFavorites>(_onAddToFavorites);
    on<_Refresh>(_onRefresh);
  }

  FutureOr<void> _onStarted(event, emit) async {
    emit(const HomeScreenState.loading());
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(HomeScreenState.loaded(coins: coins, currentTime: DateTime.now()));
  }

  FutureOr<void> _onAddToFavorites(
      _AddToFavorites event, Emitter<HomeScreenState> emit) async {
    final favoriteCoin = event.coin;
    favoriteCoin.isFavorite = !favoriteCoin.isFavorite;
    emit(HomeScreenState.loaded(coins: coins, currentTime: DateTime.now()));
  }

  FutureOr<void> _onRefresh(
      _Refresh event, Emitter<HomeScreenState> emit) async {
    coins.clear();
    emit(const HomeScreenState.loading());
    await Future.delayed(const Duration(milliseconds: 1500));
    coins = [
      Coin('Bitcoin', false),
      Coin('Ethereum', false),
      Coin('Cardano', false),
      Coin('Tether', false),
      Coin('Binance Coin', false),
      Coin('XRP', false),
      Coin('Solana', false),
      Coin('Polkadot', false),
      Coin('USD Coin', false),
      Coin('Dogecoin', false),
    ];
    emit(HomeScreenState.loaded(coins: coins, currentTime: DateTime.now()));
  }
}
