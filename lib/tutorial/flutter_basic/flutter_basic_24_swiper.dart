import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:sh_flutter_code/framework/debug/i_log.dart';

class FlutterBasicSwiper extends StatelessWidget {
  const FlutterBasicSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _ContentStateView(),
    );
  }
}

class _ContentStateView extends StatefulWidget {

  @override
  _ContentView createState() => _ContentView();
}

class _ContentView extends State<_ContentStateView> {
  /// https://github.com/feicien/flutter_swiper_view/blob/master/README-ZH.md 参考文档
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swiper Example'),
      ),
      body:  Swiper(
        itemBuilder: (context, index) {
          return Image.network("https://cdn1.epicgames.com/salesEvent/salesEvent/EGS_GenshinImpact_miHoYoLimited_S2_1200x1600-c12cdcc2cac330df2185aa58c508e820", fit: BoxFit.cover,);
        },
        itemCount: 3,
        pagination: const SwiperPagination(),
        control: const SwiperControl(
          color: Colors.black
        ),
        onTap: (index) {
          ILog.debug("???", index);
        },
      ),
    );
  }
}

void main() {
  runApp(const FlutterBasicSwiper());
}