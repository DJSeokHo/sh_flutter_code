
import 'package:flutter/material.dart';

class FlutterBasicImageView extends StatelessWidget {

  const FlutterBasicImageView({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image demo"),
        ),
        // body: _NetworkImageView(),
        // body: _RoundedCornerImageView(),
        body: _AssetsImageView(),
      ),
    );

  }

}

/// 圆角Image
class _RoundedCornerImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(150),
            image: const DecorationImage(
              image: NetworkImage( "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820"),
              fit: BoxFit.cover
            )
          ),

        ),
      ),
    );

  }
}

/// 加载本地图片，在项目跟目录建立images，然后添加 2.0x, 3.0x, 4.0x，放入同名4个文件，然后在pubspec.yaml找到assets进行配置
class _AssetsImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
              color: Colors.yellow
          ),
          child: Image.asset(
            "images/a.png",
            alignment: Alignment.center,
            color: Colors.black, // 混合用的颜色
            colorBlendMode: BlendMode.overlay, // 混合模式
            // fit: BoxFit.cover, // 图片的裁剪显示方式, cover，可能拉伸，可能剪切，图片要充满整个容器，还不能变形
            // fit: BoxFit.fill, // 图片的裁剪显示方式, fill，图片会被拉伸变形，图片要充满整个容器
            // fit: BoxFit.contain, // 图片的裁剪显示方式, contain，显示原始比例，图片要充满整个容器，有可能留下间隙
            // fit: BoxFit.fitWidth,
            // fit: BoxFit.fitHeight,
            // repeat: ImageRepeat.repeatX, // 有空隙的地方重复图片来进行填充
          ),
        ),
      ),
    );
  }

}

/// 加载网络图片
class _NetworkImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.yellow
          ),
          child: Image.network(
            "https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820",
            alignment: Alignment.topLeft,
            color: Colors.black, // 混合用的颜色
            colorBlendMode: BlendMode.overlay, // 混合模式
            // fit: BoxFit.cover, // 图片的裁剪显示方式, cover，可能拉伸，可能剪切，图片要充满整个容器，还不能变形
            // fit: BoxFit.fill, // 图片的裁剪显示方式, fill，图片会被拉伸变形，图片要充满整个容器
            // fit: BoxFit.contain, // 图片的裁剪显示方式, contain，显示原始比例，图片要充满整个容器，有可能留下间隙
            // fit: BoxFit.fitWidth,
            // fit: BoxFit.fitHeight,
            repeat: ImageRepeat.repeatX, // 有空隙的地方重复图片来进行填充
          ),
        ),
      ),
    );
  }

}

void main() {
  runApp(const FlutterBasicImageView());
}