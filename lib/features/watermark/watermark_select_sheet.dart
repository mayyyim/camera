import 'package:cameraApp/constants.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatermarkSelectorSheet extends ConsumerStatefulWidget {
  const WatermarkSelectorSheet({super.key});

  @override
  _WatermarkSelectorSheetState createState() => _WatermarkSelectorSheetState();
}

class _WatermarkSelectorSheetState extends ConsumerState<WatermarkSelectorSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '水印模板'),
            Tab(text: '我的收藏'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          WatermarkTemplateView(),
          MyFavoritesView(),
        ],
      ),
    );
  }
}

class WatermarkTemplateView extends ConsumerStatefulWidget {
  const WatermarkTemplateView({super.key});

  @override
  _WatermarkTemplateViewState createState() => _WatermarkTemplateViewState();
}

class _WatermarkTemplateViewState extends ConsumerState<WatermarkTemplateView> {
  // The index of the selected watermark category
  int _selectedCategoryIndex = 0;

  // Dummy list of categories for demonstration purposes
  final List<String> _categories = [
    '全部',
    '现场拍照',
    '时间记录',
    '叮叮记录',
    '建筑工程',
    '巡检维修',
    '物业管理'
  ];

  // Function to handle category selection
  void _onCategoryTap(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    // Load or update watermarks for the selected category
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 60,
            // ListView to scroll through the categories
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onCategoryTap(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Text(
                      _categories[index],
                      style: TextStyle(
                        color: _selectedCategoryIndex == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            // GridView.builder to display watermarks for the selected category
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 3 / 2, // Aspect ratio of each grid cell
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: Constants
                  .WATERMARKS_WIDGETS_LISTS[_selectedCategoryIndex].length,
              // Replace with actual number of watermarks
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(watermarkEditProvider.notifier)
                        .updateCurrentPhotoWatermark(Constants
                            .WATERMARKS_LISTS[_selectedCategoryIndex][index]
                            .id);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF626871),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Constants
                              .WATERMARKS_WIDGETS_LISTS[_selectedCategoryIndex]
                          [index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyFavoritesView extends StatelessWidget {
  const MyFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with actual favorite watermark data
    return ListView(
      children: const [
        // Add more WatermarkCards...
      ],
    );
  }
}

class WatermarkCard extends StatelessWidget {
  final WaterMarkWidget waterMarkWidget;

  final bool isFavorited;

  const WatermarkCard({
    Key? key,
    required this.isFavorited,
    required this.waterMarkWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.access_time, color: Colors.blue),
        title: waterMarkWidget,
        trailing: Icon(
          isFavorited ? Icons.star : Icons.star_border,
          color: isFavorited ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }
}
