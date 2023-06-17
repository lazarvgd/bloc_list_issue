import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:coins/home_screen/coin.dart';
import 'package:coins/home_screen/coin_service.dart';

part 'home_screen_bloc.freezed.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  CoinService coinService = CoinService();

  HomeScreenBloc() : super(const HomeScreenState.initial()) {
    on<_Fetch>(_onStarted);
    on<_AddToFavorites>(_onAddToFavorites);
    on<_Refresh>(_onRefresh);
  }

  FutureOr<void> _onStarted(event, emit) async {
    emit(const HomeScreenState.loading());
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(HomeScreenState.loaded(coins: coinService.coins));
  }

  FutureOr<void> _onAddToFavorites(
      _AddToFavorites event, Emitter<HomeScreenState> emit) async {
    final favoriteCoin = event.coin;
    int indexOfCoin = coinService.coins.indexOf(favoriteCoin);
    coinService.coins[indexOfCoin] = Coin(favoriteCoin.name, !favoriteCoin.isFavorite);
    emit(HomeScreenState.loaded(coins: [...coinService.coins], lastModifiedCoin: favoriteCoin));
  }

  FutureOr<void> _onRefresh(
      _Refresh event, Emitter<HomeScreenState> emit) async {
    emit(const HomeScreenState.loading());
    await Future.delayed(const Duration(milliseconds: 1500));
    coinService.clearCoins();
    emit(HomeScreenState.loaded(coins: coinService.coins));
  }
}
