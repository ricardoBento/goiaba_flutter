import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goiaba_flutter/repository/user_repository.dart';

import 'package:goiaba_flutter/bloc/authentication_bloc.dart';
import 'package:goiaba_flutter/splash/splash.dart';
import 'package:goiaba_flutter/login/login_page.dart';
import 'package:goiaba_flutter/home/home.dart';
import 'package:goiaba_flutter/common/common.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print (transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(
          userRepository: userRepository
        )..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    )
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository,);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'components/app_fab_circular_menu.dart';

// void main() {
//   runApp(RadialMenuApp());
// }

// class WhiteLabelApp extends StatelessWidget {
//   final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = Theme.of(context).primaryColor;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           body: Container(
//             decoration: BoxDecoration(
//                 color: Colors.amber,
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/wl-bg.png"),
//                     fit: BoxFit.cover)),
//             child: Center(
//               child: Text('Welcome to Flow White Label with Futter',
//                   style: TextStyle(color: Colors.amber)),
//             ),
//           ),
//           floatingActionButton: Builder(
//             builder: (context) => AppFabCircularMenu(
//               key: fabKey,
//               // Cannot be `Alignment.center`
//               alignment: Alignment.bottomRight,
//               ringColor: Colors.white.withAlpha(25),
//               ringDiameter: 500.0,
//               ringWidth: 150.0,
//               fabSize: 64.0,
//               fabElevation: 8.0,

//               // Also can use specific color based on wether
//               // the menu is open or not:
//               fabOpenColor: Colors.red,
//               fabCloseColor: Colors.blue,
//               // These properties take precedence over fabColor
//               fabColor: Colors.white,
//               fabOpenIcon: Icon(Icons.menu, color: primaryColor),
//               fabCloseIcon: Icon(Icons.close, color: primaryColor),
//               fabMargin: const EdgeInsets.all(16.0),
//               animationDuration: const Duration(milliseconds: 800),
//               animationCurve: Curves.easeInOutCirc,
//               onDisplayChange: (isOpen) {
//                 // _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
//               },
//               children: <Widget>[
//                 RawMaterialButton(
//                   onPressed: () {
//                     // _showSnackBar(context, "You pressed 1");
//                   },
//                   shape: CircleBorder(),
//                   padding: const EdgeInsets.all(24.0),
//                   child: Icon(Icons.looks_one, color: Colors.white),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () {
//                     // _showSnackBar(context, "You pressed 2");
//                   },
//                   shape: CircleBorder(),
//                   padding: const EdgeInsets.all(24.0),
//                   child: Icon(Icons.looks_two, color: Colors.white),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () {
//                     // _showSnackBar(context, "You pressed 3");
//                   },
//                   shape: CircleBorder(),
//                   padding: const EdgeInsets.all(24.0),
//                   child: Icon(Icons.looks_3, color: Colors.white),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () {
//                     // _showSnackBar(context, "You pressed 4. This one closes the menu on tap");
//                     fabKey.currentState.close();
//                   },
//                   shape: CircleBorder(),
//                   padding: const EdgeInsets.all(24.0),
//                   child: Icon(Icons.looks_4, color: Colors.white),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

// class RadialMenuApp extends StatelessWidget {
//   final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = Theme.of(context).primaryColor;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           // color: const Color(0xFF192A56),
//           decoration: BoxDecoration(
//               color: Colors.amber,
//               image: DecorationImage(
//                   image: AssetImage("assets/images/wl-bg.png"),
//                   fit: BoxFit.cover)),
//           child: Center(
//             child: RaisedButton(
//               onPressed: () {
//                 // The menu can be handled programatically using a key
//                 if (fabKey.currentState.isOpen) {
//                   fabKey.currentState.close();
//                 } else {
//                   fabKey.currentState.open();
//                 }
//               },
//               color: Colors.white,
//               child: Text('Welcome to Flow White Label with Futter',
//                   style: TextStyle(color: Colors.amber)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // void _showSnackBar (BuildContext context, String message) {
//   //   Scaffold.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text(message),
//   //         duration: const Duration(milliseconds: 1000),
//   //       )
//   //   );
//   // }
// }
