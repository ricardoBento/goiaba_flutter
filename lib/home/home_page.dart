import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goiaba_flutter/bloc/authentication_bloc.dart';
import 'package:goiaba_flutter/components/goiaba_radial_menu.dart';
import 'package:goiaba_flutter/components/app_toolbar.dart';
import 'package:goiaba_flutter/components/radial_menu.dart';
import '../components/app_fab_circular_menu.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: GoiabaAppBar(),
      // floatingActionButton: Builder(
      //   builder: (context) => AppFabCircularMenu(
      //     key: fabKey,
      //     alignment: Alignment.bottomCenter,
      //     ringColor: Colors.purple,
      //     ringDiameter: 300.0,
      //     ringWidth: 150.0,
      //     fabSize: 64.0,
      //     fabElevation: 15.0,

      //     // Also can use specific color based on wether
      //     // the menu is open or not:
      //     // fabOpenColor: Colors.red,
      //     // fabCloseColor: Colors.blue,
      //     // These properties take precedence over fabColor
      //     fabColor: Colors.white,
      //     fabOpenIcon: Icon(Icons.menu, color: primaryColor),
      //     fabCloseIcon: Icon(Icons.close, color: primaryColor),
      //     fabMargin: const EdgeInsets.all(0.0),
      //     animationDuration: const Duration(milliseconds: 800),
      //     animationCurve: Curves.easeInOutCirc,
      //     onDisplayChange: (isOpen) {
      //       // _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
      //     },
      //     children: <Widget>[
      //       RawMaterialButton(
      //         onPressed: () {
      //           // _showSnackBar(context, "You pressed 1");
      //         },
      //         shape: CircleBorder(),
      //         padding: const EdgeInsets.all(24.0),
      //         child: Icon(Icons.star_border, color: Colors.yellow),
      //       ),
      //       RawMaterialButton(
      //         onPressed: () {
      //           // _showSnackBar(context, "You pressed 2");
      //         },
      //         shape: CircleBorder(),
      //         padding: const EdgeInsets.all(24.0),
      //         child: Icon(Icons.star_border, color: Colors.yellow),
      //       ),
      //       RawMaterialButton(
      //         onPressed: () {
      //           // _showSnackBar(context, "You pressed 3");
      //         },
      //         shape: CircleBorder(),
      //         padding: const EdgeInsets.all(24.0),
      //         child: Icon(Icons.star_border, color: Colors.yellow),
      //       ),
      //       RawMaterialButton(
      //         onPressed: () {
      //           // _showSnackBar(context, "You pressed 4. This one closes the menu on tap");
      //           fabKey.currentState.close();
      //         },
      //         shape: CircleBorder(),
      //         padding: const EdgeInsets.all(24.0),
      //         child: Icon(Icons.star_border, color: Colors.yellow),
      //       ),
      //       RawMaterialButton(
      //         onPressed: () {
      //           // _showSnackBar(context, "You pressed 4. This one closes the menu on tap");
      //           fabKey.currentState.close();
      //         },
      //         shape: CircleBorder(),
      //         padding: const EdgeInsets.all(24.0),
      //         child: Icon(Icons.star_border, color: Colors.yellow),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        // child: FireRadialMenu(),
        decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage("assets/images/wl-bg.png"),
                fit: BoxFit.none)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(34.0, 20.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.width * 0.16,
                child: RaisedButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
                  },
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            // GoiabaRadialMenu(),
          ],
        ),
      ),
    );
  }
}
