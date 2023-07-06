import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';
import 'package:instagram_ui_app/ui/screens/login_screen.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/switchScreenBackground.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3.0,
                        sigmaY: 3.0,
                      ),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/profile.jpg'),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Sobhan Ziyaei',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 100,
                              height: 36,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                      color: CustomColor.white, fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              'switch account',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 63, top: 132),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ? /',
                  style: TextStyle(
                      color: CustomColor.grey, fontFamily: 'GB', fontSize: 16),
                ),
                Text(
                  ' Sign up',
                  style: TextStyle(
                      color: CustomColor.white, fontFamily: 'GB', fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
