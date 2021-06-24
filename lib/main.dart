import 'package:flutter/material.dart';
import 'package:smart_dream/repositories/impl/preferences_repository_impl.dart';
import 'package:smart_dream/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'cubit/preferences/preferences_cubit.dart';

void main() async {
  //

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final preferenceRepository = PreferencesRepositoryImpl();

  runApp(
    App(
      preferencesRepository: preferenceRepository,
      preferencesCubit: PreferencesCubit(
          preferencesRepository: preferenceRepository,
          initialLocale: await preferenceRepository.locale),
    ),
  );

  //
}
