import 'package:flutter/material.dart';

class FadeAnimationImageExample extends StatelessWidget {

  const FadeAnimationImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ScrollTag Example"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: const Center(
              // child: ScaleAnimationRoute(),
              child: CustomAssetImage(
                "images/coding_with_cat_icon.jpeg",
                300, 300,
                BoxFit.contain
              ),
          ),
        ),
      ),
    );
  }
}

class CustomAssetImage extends StatefulWidget {

  final String assetPath;
  final double width;
  final double height;
  final BoxFit? fit;

  const CustomAssetImage(this.assetPath, this.width, this.height, this.fit, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomAssetImageState();
  }
}

class _CustomAssetImageState extends State<CustomAssetImage> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    //匀速
    _animation = Tween(begin: 0.0, end: 100.0).animate(_controller)
      ..addListener(() {
        setState(() => {});
      });

    //启动动画(正向执行)
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Opacity(
        opacity: _animation.value * 0.01,
        child: Image.asset(
          widget.assetPath,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        ),
      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    _controller.dispose();
    super.dispose();
  }
}
