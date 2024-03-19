import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatermarkBottomSheet extends ConsumerStatefulWidget {
  const WatermarkBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WatermarkBottomSheetState createState() => _WatermarkBottomSheetState();
}

class _WatermarkBottomSheetState extends ConsumerState<WatermarkBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: [
              const Tab(text: '水印'),
              const Tab(text: '我的收藏'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const WatermarkTabContent(), // Content for the Watermark tab
                const FavoritesTabContent(), // Content for the Favorites tab
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WatermarkTabContent extends StatelessWidget {
  const WatermarkTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for watermark tab content
    return const Center(
      child: Text('水印内容'),
    );
  }
}

class FavoritesTabContent extends StatelessWidget {
  const FavoritesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for favorites tab content
    return const Center(
      child: Text('我的收藏内容'),
    );
  }
}

void showWatermarkEditBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => const WatermarkBottomSheet(),
  );
}
