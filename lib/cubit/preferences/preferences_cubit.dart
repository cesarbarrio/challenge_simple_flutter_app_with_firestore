import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:smart_dream/repositories/contracts/preferences_repository.dart';
import 'package:equatable/equatable.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  //

  final PreferencesRepository _preferencesRepository;

  PreferencesCubit({
    required PreferencesRepository preferencesRepository,
    required Locale initialLocale,
  })  : _preferencesRepository = preferencesRepository,
        super(PreferencesChangeLocaleSuccessState(locale: initialLocale));

  void changeLocale(Locale locale) async {
    await _preferencesRepository.saveLocale(locale);

    emit(
      PreferencesChangeLocaleSuccessState(locale: locale),
    );
  }

  //
}
