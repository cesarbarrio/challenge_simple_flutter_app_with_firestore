part of 'preferences_cubit.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();

  @override
  List<Object> get props => [];
}

class PreferencesChangeLocaleSuccessState extends PreferencesState {
  //

  final Locale locale;

  PreferencesChangeLocaleSuccessState({
    required this.locale,
  });

  @override
  List<Object> get props => [
        locale,
      ];

  @override
  String toString() =>
      'PreferencesChangeLocaleSuccessState: { locale: $locale }';

  //
}