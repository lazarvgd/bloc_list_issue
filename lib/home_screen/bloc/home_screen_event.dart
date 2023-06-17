part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.fetch() = _Fetch;
  const factory HomeScreenEvent.refresh() = _Refresh;
  const factory HomeScreenEvent.addToFavorites({required Coin coin}) = _AddToFavorites;
}
