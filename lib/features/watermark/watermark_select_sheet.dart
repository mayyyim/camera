import 'package:cameraApp/constants.dart';
import 'package:cameraApp/features/watermark/watermark_edit_sheet.dart';
import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/shared/Widget/watermark/watermark_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    return SizedBox(
      height: 500,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: '水印模板'),
              Tab(text: '我的收藏'),
            ],
          ),
          SizedBox(
            height: 420,
            child: TabBarView(
              controller: _tabController,
              children: const [
                WatermarkTemplateView(),
                MyFavoritesView(),
              ],
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                childAspectRatio: 3 / 2.4, // Aspect ratio of each grid cell
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: Constants
                  .WATERMARKS_WIDGETS_LISTS[_selectedCategoryIndex].length,
              // Replace with actual number of watermarks
              itemBuilder: (context, index) {
                bool isSelected = ref
                        .read(watermarkEditProvider)
                        .currentWatermark
                        .watermarkItem
                        .id ==
                    Constants
                        .WATERMARKS_LISTS[_selectedCategoryIndex][index].id;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ref
                              .read(watermarkEditProvider.notifier)
                              .updateCurrentPhotoWatermark(Constants
                                  .WATERMARKS_LISTS[_selectedCategoryIndex]
                                      [index]
                                  .id);
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 110,
                            margin: const EdgeInsets.only(bottom: 3),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF626871),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 4),
                            ),
                            child: Stack(
                              children: [
                                Transform.scale(
                                  scale: 0.7,
                                  child: Center(
                                    child: Constants.WATERMARKS_WIDGETS_LISTS[
                                        _selectedCategoryIndex][index],
                                  ),
                                ),
                                Positioned.fill(
                                  child: AnimatedOpacity(
                                    opacity: isSelected ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(
                                            5), // 可选：如果你想要圆角遮罩层
                                      ),
                                    ),
                                  ),
                                ),
                                isSelected
                                    ? GestureDetector(
                                        onTap: () {
                                          context.pop();
                                          showModalBottomSheet(
                                            context: context,
                                            barrierColor: Colors.black,
                                            backgroundColor: Colors.black,
                                            builder: (context) =>
                                                WatermarkEditBottomSheet(
                                                    (Constants.WATERMARKS_WIDGETS_LISTS[
                                                                _selectedCategoryIndex]
                                                            [index])
                                                        .watermarkVisibleMap),
                                          );
                                        },
                                        child: Center(
                                          child: Container(
                                            height: 40,
                                            width: 80,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "编辑",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          Positioned(
                            left: 5,
                            top: 4,
                            child: Container(
                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                              ),
                              child: Text(
                                Constants
                                    .WATERMARKS_LISTS[_selectedCategoryIndex]
                                        [index]
                                    .id,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          parseTagName(Constants
                              .WATERMARKS_LISTS[_selectedCategoryIndex][index]
                              .tag
                              .name),
                          style: const TextStyle(fontSize: 13),
                        ),
                        GestureDetector(
                          onTap: () {
                            /// TODO
                            /// like this
                          },
                          child: Constants
                                  .WATERMARKS_LISTS[_selectedCategoryIndex]
                                      [index]
                                  .isLiked
                              ? const Icon(
                                  Icons.star,
                                  size: 25,
                                  color: Colors.amber,
                                )
                              : const Icon(
                                  Icons.star_border_outlined,
                                  size: 25,
                                  color: Colors.amber,
                                ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String parseTagName(String tag) {
    String result = "";
    switch (tag) {
      case "shijianjilu":
        result = "时间记录";
        break;
      case "xianchangpaizhao":
        result = "现场拍照";
        break;
      case "dingdingjilu":
        result = "叮叮记录";
        break;
      case "jianzhugongcheng":
        result = "建筑工程";
        break;
      case "xunjianweixiu":
        result = "巡检维修";
        break;
      case "wuyeguanli":
        result = "物业管理";
        break;
    }
    return result;
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
  final bool isSelected;
  final bool isFavorited;

  const WatermarkCard({
    Key? key,
    required this.isFavorited,
    required this.waterMarkWidget,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: isSelected ? 1 : 0)),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.access_time, color: Colors.blue),
          title: waterMarkWidget,
          trailing: Icon(
            isFavorited ? Icons.star : Icons.star_border,
            color: isFavorited ? Colors.yellow : Colors.grey,
          ),
        ),
      ),
    );
  }
}
