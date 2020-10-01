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
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            return LoginPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   final items = [
//     RadialMenuItem(
//         Icon(Icons.star, color: Colors.white), Colors.red, () => print('red')),
//     RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.green,
//         () => print('green')),
//     RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.blue,
//         () => print('blue')),
//     RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.yellow,
//         () => print('yellow')),
//     RadialMenuItem(Icon(Icons.star, color: Colors.white), Colors.purple,
//         () => print('purple')),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(children: [
//           RadialMenu(items, fanout: Fanout.bottom),
//           Divider(),
//         ]),
//       ),
//     );
//   }
// }
