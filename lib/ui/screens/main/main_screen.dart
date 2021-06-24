import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_dream/cubit/navigation/navigation_cubit.dart';
import 'package:smart_dream/ui/common/navigation/routes_navigation.dart';
import 'package:smart_dream/ui/screens/main/widgets/main_drawer.dart';
import 'package:smart_dream/ui/screens/main/widgets/main_body.dart';

class MainScreen extends StatelessWidget {
  //

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //

    void _navigateToScreen(VoidCallback navigate) {
      //

      final cubit = BlocProvider.of<NavigationCubit>(context);

      if (cubit.state is! NavigationMainState) {
        cubit.navigateToMainScreen();
      }

      navigate();

      //
    }

    return BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context, state) {
        //

        if (state is NavigationShoppingCartScreenState) {
          navigateToShoppingCartScreen(context);
        }

        //
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 0.0,
          ),
          drawerEnableOpenDragGesture: false,
          drawer: MainDrawer(
            onTabShoppingCartOption: () => _navigateToScreen(
              BlocProvider.of<NavigationCubit>(context)
                  .navigateToShoppingCartScreen,
            ),
          ),
          body: MainBody(),
        );
      },
    );

    //
  }

  //
}
