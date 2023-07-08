import 'package:flutter/material.dart';
import 'package:instagram_ui_app/data/constants/custom_color.dart';
import 'package:instagram_ui_app/models/enums/activity_status.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: CustomColor.black,
              height: 50,
              child: TabBar(
                controller: _tabController,
                labelStyle: const TextStyle(fontSize: 14, fontFamily: 'GB'),
                indicatorColor: CustomColor.pink,
                indicatorWeight: 3,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: const [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      const SliverPadding(
                        padding: EdgeInsets.only(left: 30, top: 32),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            'New',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontSize: 16,
                                fontFamily: 'GB'),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRow();
                          },
                          childCount: 2,
                        ),
                      ),
                      const SliverPadding(
                        padding: EdgeInsets.only(left: 30, top: 32),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            'Today',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontSize: 16,
                                fontFamily: 'GB'),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRowYou();
                          },
                          childCount: 4,
                        ),
                      ),
                      const SliverPadding(
                        padding: EdgeInsets.only(left: 30, top: 32),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            'This Week',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontSize: 16,
                                fontFamily: 'GB'),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRowYou();
                          },
                          childCount: 4,
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      const SliverPadding(
                        padding: EdgeInsets.only(left: 30, top: 32),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            'New',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontSize: 16,
                                fontFamily: 'GB'),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRowYou();
                          },
                          childCount: 2,
                        ),
                      ),
                      const SliverPadding(
                        padding: EdgeInsets.only(left: 30, top: 32),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            'Today',
                            style: TextStyle(
                                color: CustomColor.white,
                                fontSize: 16,
                                fontFamily: 'GB'),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return _getRow();
                          },
                          childCount: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColor.pink,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/item8.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'sobhan ziyaei',
                    style: TextStyle(
                        color: CustomColor.white,
                        fontFamily: 'GB',
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Starting following',
                    style: TextStyle(
                        fontFamily: 'GM',
                        color: CustomColor.grey,
                        fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'you 3 min',
                style: TextStyle(
                    color: CustomColor.grey, fontFamily: 'GM', fontSize: 10),
              ),
            ],
          ),
          const Spacer(),
          _getContentWithStatus(ActivityStatus.following),
        ],
      ),
    );
  }

  Widget _getRowYou() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColor.pink,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/profile.jpg'),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'sobhan ziyaei',
                    style: TextStyle(
                        color: CustomColor.white,
                        fontFamily: 'GB',
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Starting following',
                    style: TextStyle(
                        fontFamily: 'GM',
                        color: CustomColor.grey,
                        fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'you 3 min',
                style: TextStyle(
                    color: CustomColor.grey, fontFamily: 'GM', fontSize: 10),
              ),
            ],
          ),
          const Spacer(),
          _getContentWithStatus(ActivityStatus.followBack),
        ],
      ),
    );
  }

  Widget _getContentWithStatus(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/item5.png'),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(width: 2.0, color: CustomColor.grey),
            ),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Text(
              'Message',
              style: TextStyle(
                  color: CustomColor.white, fontFamily: 'GB', fontSize: 12),
            ),
          ),
        );
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Follow',
            style: TextStyle(
                color: CustomColor.white, fontFamily: 'GB', fontSize: 12),
          ),
        );
    }
  }
}
