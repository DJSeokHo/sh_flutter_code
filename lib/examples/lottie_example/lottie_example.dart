import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../framework/debug/i_log.dart';

const _tag = "LottieExample";

class LottieExample extends StatelessWidget {
  const LottieExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Lottie Example"),
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _MenuView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuViewState();
  }
}

class _MenuViewState extends State<_MenuView> with TickerProviderStateMixin {

  late final AnimationController _controller;

  bool menuFlag = false;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {

      ILog.debug(_tag, "addListener ${_controller.value}");
      if (_controller.value == 1) {
        _controller.value = 0;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        ILog.debug(_tag, menuFlag);

        if (_controller.isAnimating) {
          return;
        }

        if (menuFlag) {
          _controller
            ..duration = duration
            ..animateTo(1);

          menuFlag = false;
        }
        else {
          _controller
            ..duration = duration
            ..animateTo(0.5);

          menuFlag = true;
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.orange,
        width: 100,
        height: 100,
        child: Lottie.asset(
            'images/menu_icon.json',
            controller: _controller,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              ILog.debug(_tag, "${composition.duration} - ${composition.durationFrames} - ${composition.startFrame}");
              duration = composition.duration;
            },
            repeat: false,
            fit: BoxFit.cover
        ),
      ),
    );
  }

}