part of 'home_screen_bloc.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.loaded({required List<Coin> coins}) = _Loaded;
  const factory HomeScreenState.error() = _Error;

}
