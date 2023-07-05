import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';
import 'package:instagram_ui_app/ui/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                style: TextStyle(color: CustomColor.grey, fontSize: 10),
              ),
              Text(
                'Expert Flutter',
                style: TextStyle(color: CustomColor.blue, fontSize: 12),
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
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }
}
