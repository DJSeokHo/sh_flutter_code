import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MaterialApp(
    home: TextMaskExample(maskText: "W"), // 你想要的遮罩文字
  ));
}

class TextMaskExample extends StatefulWidget {

   final String maskText;

  const TextMaskExample({super.key, required this.maskText});

  @override
  State<StatefulWidget> createState() {
    return _TextMaskExampleState();
  }

}
class _TextMaskExampleState extends State<TextMaskExample> with TickerProviderStateMixin {

  late final AnimationController _controller;
  late final AnimationController _fadeOutController;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeInFadeOut;
  late final Animation<double> _fadeOutFadeIn;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
      );

      _fadeOutController = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this,
      );

      _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
      _fadeOutFadeIn = Tween<double>(begin: 1.0, end: 0.0).animate(_fadeOutController);

      _scaleAnimation = Tween(begin: 1.1, end: 1.1)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _offsetAnimation = Tween<Offset>(
        begin: const Offset(0.05, 0.0),
        end: const Offset(-0.05, 0),
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      Future.delayed(const Duration(milliseconds: 1000), () {
        _controller.forward();
        _fadeOutController.forward();
      },);

    },);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.stop();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ui.Image>(
        future: _loadNetworkImage('https://d2pw36ijlx16fz.cloudfront.net/file/banner/5ace4d5f-580f-476f-9494-1326af61fabd.jpg'), // 加载网络图片
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            // 图片加载成功后，使用 ShaderMask
            return Stack(
              children: [

                Positioned.fill(
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: FadeTransition(
                        opacity: _fadeInFadeOut,
                        child: Image.network(
                          'https://d2pw36ijlx16fz.cloudfront.net/file/banner/5ace4d5f-580f-476f-9494-1326af61fabd.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                FadeTransition(
                  opacity: _fadeOutFadeIn,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        // 使用网络图片创建 ShaderMask
                        ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (bounds) {
                            return ImageShader(
                              snapshot.data!,
                              TileMode.clamp,
                              TileMode.clamp,
                              Matrix4.identity().storage,
                            );
                          },
                          child: Center(
                            child: TweenAnimationBuilder<double>(
                              curve: Curves.fastOutSlowIn,
                              tween: Tween(begin: 100.0, end: 300.0),
                              duration: const Duration(seconds: 1),
                              builder: (context, fontSize, child) {
                                return Text(
                                  widget.maskText,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // 白色文字，遮罩效果才能体现出来
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            );
          }
          else {
            // 如果图片还在加载，显示加载状态
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // 加载网络图片并将其转换为 ui.Image
  Future<ui.Image> _loadNetworkImage(String url) async {
    final completer = Completer<ui.Image>();
    final networkImage = NetworkImage(url);
    networkImage.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(info.image);
      }),
    );
    return completer.future;
  }
}
