import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:smart_dream/cubit/navigation/navigation_cubit.dart';
import 'package:smart_dream/cubit/preferences/preferences_cubit.dart';
import 'package:smart_dream/cubit/products/products_cubit.dart';
import 'package:smart_dream/cubit/shoppingCart/shopping_cart_cubit.dart';
import 'package:smart_dream/repositories/contracts/products_repository_impl.dart';
import 'package:smart_dream/repositories/contracts/preferences_repository.dart';
import 'package:smart_dream/generated/l10n.dart';
import 'package:smart_dream/repositories/contracts/shopping_cart_repository.dart';
import 'package:smart_dream/repositories/impl/products_repository_impl.dart';
import 'package:smart_dream/repositories/impl/shopping_cart_repository_fake.dart';
import 'package:smart_dream/ui/screens/main/main_screen.dart';
import 'package:smart_dream/ui/screens/shoppingCart/shopping_cart_screen.dart';
import 'package:smart_dream/ui/styles/themes.dart';

class App extends StatelessWidget {
  //

  final PreferencesRepository _preferencesRepository;
  final PreferencesCubit _preferencesCubit;

  App({
    required PreferencesRepository preferencesRepository,
    required PreferencesCubit preferencesCubit,
  })  : _preferencesRepository = preferencesRepository,
        _preferencesCubit = preferencesCubit;

  @override
  Widget build(BuildContext context) {
    //Here you can choose the repositories to use into the cubit blocs
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PreferencesRepository>.value(
          value: _preferencesRepository,
        ),
        RepositoryProvider<ProductsRepository>(
          create: (context) => ProductsRepositoryImpl(),
        ),
        RepositoryProvider<ShoppingCartRepository>(
          create: (context) => ShoppingCartRepositoryFake(),
        ),
      ],
      //Here the blocs are instanced
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PreferencesCubit>.value(value: _preferencesCubit),
          BlocProvider<NavigationCubit>(
            create: (context) => NavigationCubit(),
          ),
          BlocProvider<ProductsCubit>(
            create: (context) => ProductsCubit(
                productsRepository:
                    RepositoryProvider.of<ProductsRepository>(context)),
          ),
          BlocProvider<ShoppingCartCubit>(
            create: (context) => ShoppingCartCubit(
                shoppingCartRepository:
                    RepositoryProvider.of<ShoppingCartRepository>(context)),
          ),
        ],
        child: BlocBuilder<PreferencesCubit, PreferencesState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: styleThemes[StyleTheme.light],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
                LocaleNamesLocalizationsDelegate(),
              ],
              supportedLocales: AppLocalizations.delegate.supportedLocales,
              locale: (state is PreferencesChangeLocaleSuccessState)
                  ? state.locale
                  : null,
              home: MainScreen(),
              initialRoute: '/',
              routes: {
                '/shopping-cart': (context) => ShoppingCartScreen(),
              },
            );
          },
        ),
      ),
    );
  }

  //
}
