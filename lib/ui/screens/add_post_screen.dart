import 'package:flutter/material.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  int _selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _getMainScrollViewContent(context),
            Container(
              width: double.infinity,
              height: 83,
              decoration: const BoxDecoration(
                color: CustomColor.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(right: 17, left: 17, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Draft',
                      style: TextStyle(
                        color: CustomColor.pink,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: CustomColor.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                    Text(
                      'Take',
                      style: TextStyle(
                        color: CustomColor.white,
                        fontSize: 16,
                        fontFamily: 'GB',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMainScrollViewContent(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          sliver: SliverToBoxAdapter(
            child: _getHeaderSection(),
          ),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 20, right: 17, left: 17),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedImage = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/images/item$index.png'),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 90),
        )
      ],
    );
  }

  Widget _getSelectedImageContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/images/item$_selectedImage.png'),
        ),
      ),
    );
  }

  Widget _getHeaderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Container(
        width: double.infinity,
        height: 26,
        decoration: const BoxDecoration(
          color: CustomColor.black,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Post',
              style: TextStyle(
                  color: CustomColor.white, fontFamily: 'GB', fontSize: 20),
            ),
            const SizedBox(
              width: 15,
            ),
            Image.asset('assets/images/icon_arrow_down.png'),
            const Spacer(),
            const Text(
              'Next',
              style: TextStyle(
                  color: CustomColor.white, fontFamily: 'GB', fontSize: 16),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset('assets/images/icon_arrow_right_box.png'),
          ],
        ),
      ),
    );
  }
}
