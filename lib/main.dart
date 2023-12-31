import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';
import 'package:instagram_ui_app/ui/screens/login_screen.dart';
import 'package:instagram_ui_app/ui/screens/switch_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
              color: CustomColor.white, fontFamily: 'GB', fontSize: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontFamily: 'GB', fontSize: 14, color: CustomColor.white),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(CustomColor.pink),
          ),
        ),
      ),
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroundPattern.png'),
              repeat: ImageRepeat.repeat),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SplashScreen(),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Image.asset(
            'assets/images/splashLogo.png',
            width: 155,
            height: 77,
          ),
        ),
        const Positioned(
          bottom: 240,
          child: SpinKitSpinningLines(
            color: CustomColor.white,
            size: 30,
          ),
        ),
        const Positioned(
          bottom: 30,
          child: Column(
            children: [
              Text(
                'From',
                style: TextStyle(
                    color: CustomColor.grey, fontSize: 10, fontFamily: 'GB'),
              ),
              Text(
                'Expert Flutter',
                style: TextStyle(
                    color: CustomColor.blue, fontSize: 12, fontFamily: 'GB'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _navigateScreen() async {
    await Future.delayed(
      const Duration(seconds: 4),
      () {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SwitchAccountScreen(),
          ),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
