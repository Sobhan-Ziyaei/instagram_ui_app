import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';

class ShowModelSheet extends StatelessWidget {
  const ShowModelSheet({Key? key, required this.controller}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          color: const Color.fromRGBO(255, 255, 255, 0.09),
          height: 300,
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 67,
                    decoration: const BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Share',
                        style: TextStyle(
                            color: CustomColor.white,
                            fontSize: 20,
                            fontFamily: 'GB'),
                      ),
                      Image.asset(
                        'assets/images/icon_share_bottomsheet.png',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: double.infinity,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Image.asset('assets/images/icon_search.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: TextField(
                              style: TextStyle(
                                  color: CustomColor.white,
                                  fontFamily: 'GB',
                                  fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: CustomColor.white,
                                    fontFamily: 'GB',
                                    fontSize: 14),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    child: _getItem(),
                  );
                },
                childCount: 50,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 110,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 100),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 13),
              child: Text(
                'Send',
                style: TextStyle(
                    color: CustomColor.white, fontFamily: 'GB', fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getItem() {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.asset('assets/images/profile.jpg'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Sobhan Ziyaei',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColor.white,
            fontFamily: 'GB',
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
