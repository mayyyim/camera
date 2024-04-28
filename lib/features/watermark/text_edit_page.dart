import 'package:cameraApp/features/watermark/watermark_provider.dart';
import 'package:cameraApp/shared/Widget/basic_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TextEditPage extends ConsumerStatefulWidget {
  const TextEditPage(this.title, {super.key});

  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TextEditPageState();
  }
}

class TextEditPageState extends ConsumerState<TextEditPage> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BasicHeader(
              text: "编辑${widget.title}字段",
              widget: GestureDetector(
                onTap: () {
                  updateContent(ref, content: textEditingController.value.text);
                  context.pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration:
                      const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Text(
                    "保存",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "请输入${widget.title}字段",
                    hintStyle: TextStyle(
                      color: Theme.of(context).textTheme.labelSmall!.color,
                    ),
                    border: InputBorder.none,
                    counterStyle: const TextStyle(
                      color: Colors.black,
                    )),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                cursorColor: Theme.of(context).primaryColorDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateContent(WidgetRef ref, {required String content}) {
    switch (widget.title) {
      case "备注":
        ref.read(watermarkEditProvider.notifier).updateCurrentBeizhu(content);
        break;
      case "巡检人":
        ref.read(watermarkEditProvider.notifier).updateCurrentXunjianren(content);
        break;
      case "巡检区域":
        ref.read(watermarkEditProvider.notifier).updateCurrentXunjianquyu(content);
        break;
      case "巡检类型":
        ref.read(watermarkEditProvider.notifier).updateCurrentXunjianleixing(content);
        break;

      case "自定义":
        ref.read(watermarkEditProvider.notifier).updateCurrentCustomized(content);
        break;

      case "地点":
        ref.read(watermarkEditProvider.notifier).updateCurrentLocation(content);
        break;

      case "经度":
        ref.read(watermarkEditProvider.notifier).updateCurrentJindu(content);
        break;

      case "纬度":
        ref.read(watermarkEditProvider.notifier).updateCurrentWeidu(content);
        break;

      case "天气":
        ref.read(watermarkEditProvider.notifier).updateCurrentWeather(content);
        break;

      case "时间验证":
        ref.read(watermarkEditProvider.notifier).updateCurrentShijianyanzheng(content);
        break;

      case "速度":
        ref.read(watermarkEditProvider.notifier).updateCurrentSudu(content);
        break;
      case "添加自定义项":
        ref.read(watermarkEditProvider.notifier).updateCurrentTianjiazidingyi(content);
        break;
      case "编号":
        ref.read(watermarkEditProvider.notifier).updateCurrenBianhao(content);
        break;
      case "手机号":
        ref.read(watermarkEditProvider.notifier).updateCurrentshoujihao(content);
        break;
      case "IMEI":
        ref.read(watermarkEditProvider.notifier).updateCurrentIMEI(content);
        break;
      case "计数":
        ref.read(watermarkEditProvider.notifier).updateCurrentjishu(content);
        break;
      case "监理责任人":
        ref.read(watermarkEditProvider.notifier).updateCurrentjianlifuzeren(content);
        break;
      case "竣工倒计时":
        ref.read(watermarkEditProvider.notifier).updateCurrentjungongdaojishi(content);
        break;
      case "建设单位":
        ref.read(watermarkEditProvider.notifier).updateCurrentjianshedanwei(content);
        break;
      case "监理单位":
        ref.read(watermarkEditProvider.notifier).updateCurrentjianlidanwei(content);
        break;
      case "设计单位":
        ref.read(watermarkEditProvider.notifier).updateCurrentshejidanwei(content);
        break;
      case "勘察单位":
        ref.read(watermarkEditProvider.notifier).updateCurrentKanchadanwei(content);
        break;
      case "描述":
        ref.read(watermarkEditProvider.notifier).updateCurrentmiaoshu(content);
        break;
      case "大标题":
        ref.read(watermarkEditProvider.notifier).updateCurrentDabiaoti(content);
        break;
      case "小标题":
        ref.read(watermarkEditProvider.notifier).updateCurrentXiaobiaoti(content);
        break;
    }
  }
}
