import 'package:flutter/material.dart';
import 'package:smart_dream/generated/l10n.dart';

class MainDrawer extends StatelessWidget {
  //

  final VoidCallback _onTabShoppingCartOption;

  MainDrawer({
    required VoidCallback onTabShoppingCartOption,
  }) : _onTabShoppingCartOption = onTabShoppingCartOption;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff308394), Color(0xffD7D7D7)],
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  color: Colors.white,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding: EdgeInsets.only(
                          left: 15.0,
                          top: 22.0,
                          bottom: 22.0,
                        ),
                        leading: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        title: Text(
                          AppLocalizations.of(context)
                              .mainDrawerShoppingCartOption,
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: _onTabShoppingCartOption,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
}
