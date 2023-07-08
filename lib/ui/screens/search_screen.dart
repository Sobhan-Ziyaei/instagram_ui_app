import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _getContent(),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 23, left: 8, right: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/item$index.png'),
                    ),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 1),
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Column _getContent() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: double.infinity,
            height: 46,
            decoration: const BoxDecoration(
              color: Color(0xff272B40),
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
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: CustomColor.white,
                          fontSize: 12,
                          fontFamily: 'GB'),
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                            color: CustomColor.white,
                            fontSize: 12,
                            fontFamily: 'GB'),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset('assets/images/icon_scan.png'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _getHashtagList()
      ],
    );
  }

  Widget _getHashtagList() {
    return SizedBox(
      height: 23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: const BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  'Sobhan Ziyaei $index',
                  style: const TextStyle(
                      color: CustomColor.white, fontSize: 10, fontFamily: 'GB'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
