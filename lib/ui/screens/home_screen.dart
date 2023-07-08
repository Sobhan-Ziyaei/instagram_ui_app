import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';
import 'package:instagram_ui_app/ui/widgets/show_modal_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor.black,
        elevation: 0,
        title: SizedBox(
          width: 110,
          height: 28,
          child: Image.asset('assets/images/mood.png'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              width: 26,
              height: 26,
              child: Image.asset('assets/images/icon_direct.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _getListPost();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _getListPost() {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              _getHeaderPost(),
              const SizedBox(
                height: 15,
              ),
              _getPost(context)
            ],
          );
        },
      ),
    );
  }

  SizedBox _getStoryList() {
    return SizedBox(
      height: 83,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0 ? _getAddStoryBox() : _getListStoryBox();
          },
        ),
      ),
    );
  }

  Widget _getPost(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.2,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.55,
                  child: Image.asset(
                    'assets/images/paris.jpg',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Image.asset('assets/images/icon_video.png'),
            ),
            Positioned(
              bottom: 15,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerLeft,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.5),
                          Color.fromRGBO(255, 255, 255, 0.2),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/icon_hart.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '2.6 K',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontFamily: 'GB',
                                fontSize: 14),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Image.asset('assets/images/icon_comments.png'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '1.5 K',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontFamily: 'GB',
                                fontSize: 14),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: DraggableScrollableSheet(
                                      initialChildSize: 0.4,
                                      minChildSize: 0.2,
                                      maxChildSize: 0.7,
                                      builder: (context, scrollController) {
                                        return ShowModelSheet(
                                          controller: scrollController,
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image.asset('assets/images/icon_share.png'),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Image.asset('assets/images/icon_save.png')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _getHeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getStoryBox(),
          const SizedBox(
            width: 10,
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sobhan ziyaei',
                style: TextStyle(
                    fontFamily: 'GB', fontSize: 12, color: CustomColor.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'سبحان ضیائی برنامه‌نویس فلاتر',
                style: TextStyle(
                    color: CustomColor.white, fontFamily: 'SM', fontSize: 12),
              )
            ],
          ),
          const Spacer(),
          Image.asset('assets/images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getStoryBox() {
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 2,
      dashPattern: const [40, 10],
      radius: const Radius.circular(17),
      padding: const EdgeInsets.all(4),
      color: CustomColor.pink,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: SizedBox(
          width: 38,
          height: 38,
          child: Image.asset('assets/images/profile.jpg'),
        ),
      ),
    );
  }

  Widget _getListStoryBox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: DottedBorder(
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: const [40, 10],
            radius: const Radius.circular(17),
            padding: const EdgeInsets.all(4),
            color: CustomColor.pink,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset('assets/images/profile.jpg'),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Sobhan',
          style: TextStyle(
              color: CustomColor.white, fontSize: 12, fontFamily: 'GM'),
        )
      ],
    );
  }

  Widget _getAddStoryBox() {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: const BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: const BoxDecoration(
                color: CustomColor.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Image.asset('assets/images/icon_plus.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Your Story',
          style: TextStyle(
              color: CustomColor.white, fontFamily: 'GM', fontSize: 12),
        )
      ],
    );
  }
}
